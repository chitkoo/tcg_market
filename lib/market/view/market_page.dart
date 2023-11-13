import 'package:cached_network_image/cached_network_image.dart';
import 'package:cards_list_repository/cards_list_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../common/common_methods.dart';
import '../../common/screen_wrapper.dart';
import '../../details/view/details_page.dart';
import '../../utils/values.dart';
import '../bloc/market_bloc.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MarketBloc(
        cardsListReporitory: CardsListReporitory(),
      )..add(
          GetCardsList(),
        ),
      child: const MarketView(),
    );
  }
}

class MarketView extends StatelessWidget {
  const MarketView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Pokémon TCG Market',
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        backgroundColor: primaryColor,
        body: BlocConsumer<MarketBloc, MarketState>(
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.status) {
              case ApiStatus.loading:
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              case ApiStatus.succeeded:
                return ListView.separated(
                  padding:
                      EdgeInsets.symmetric(horizontal: 7.5.w, vertical: 5.w),
                  itemCount: state.cardsList.length,
                  itemBuilder: (context, index) {
                    final cardItem = state.cardsList[index];
                    return _CardItem(cardItem: cardItem);
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 5.w,
                  ),
                );

              case ApiStatus.failed:
                return const Center(
                  child: Text('Failed'),
                );
              case ApiStatus.pure:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  const _CardItem({
    required this.cardItem,
  });

  final CardData cardItem;

  @override
  Widget build(BuildContext context) {
    final cardImage = cardItem.images?.small ?? '';
    final cardName = cardItem.name;
    final superType = cardItem.supertype;
    final hp = cardItem.hp ?? 100;
    final type = cardItem.types?[0] ?? 'Colorless';

    final price = cardItem.tcgplayer?.tcgPrices?.holofoil?.market ?? '19.99';

    return InkWell(
      borderRadius: BorderRadius.circular(5.w),
      onTap: () => Navigator.of(context).push(
        CommonMethods.buildPageRoute(
            page: DetailsPage(
          cardItem: cardItem,
        )),
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: 85.w,
        height: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5.w),
          color: textColor,
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.1),
              offset: const Offset(1, 1),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: cardImage,
              width: 35.w,
              height: 50.w,
              fit: BoxFit.fill,
            ),
            Container(
              width: 50.w,
              height: 50.w,
              padding: EdgeInsets.all(2.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardName ?? '',
                    style: const TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  Text.rich(
                    TextSpan(
                      text: '$superType - ',
                      children: List.generate(
                        cardItem.subtypes?.length ?? 0,
                        (index) {
                          final subType = cardItem.subtypes![index];
                          final isLastItem =
                              index == cardItem.subtypes!.length - 1;
                          final punctuation = isLastItem ? '' : ', ';
                          return TextSpan(
                            text: '$subType$punctuation',
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'HP $hp',
                        style: const TextStyle(
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Container(
                        width: 6.w,
                        height: 6.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: CommonMethods.getDecoImageWidget(type),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  Text(
                    '\$ $price',
                    style: const TextStyle(
                      color: primaryColor,
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Add to cart'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
