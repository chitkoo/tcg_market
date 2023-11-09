import 'package:cards_list_repository/cards_list_repository.dart';
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
            style: TextStyle(
              color: primaryColor,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: BlocConsumer<MarketBloc, MarketState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(5.w),
                onTap: () => Navigator.of(context).push(
                  CommonMethods.buildPageRoute(page: const DetailsPage()),
                ),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  width: 85.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.w),
                    color: Colors.white,
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
                      Image.asset(
                        'assets/images/test.png',
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
                            const Text(
                              'Celebi & Venusaur-GX',
                              style: TextStyle(
                                color: primaryColor,
                                // fontSize: titleText,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 2.w,
                            ),
                            const Text(
                              'Pokémon - Basic, TAG TEAM, GX',
                              style: TextStyle(
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 2.w,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'HP 270',
                                  style: TextStyle(
                                    color: primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Container(
                                  width: 6.w,
                                  height: 6.w,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/symbol.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              '\$ 40',
                              style: TextStyle(
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
              ),
            );
          },
        ),
      ),
    );
  }
}
