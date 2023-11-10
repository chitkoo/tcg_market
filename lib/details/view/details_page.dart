import 'package:cached_network_image/cached_network_image.dart';
import 'package:cards_list_repository/cards_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../common/common_methods.dart';
import '../../common/screen_wrapper.dart';
import '../../utils/values.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.cardItem,
  });

  final CardData cardItem;

  @override
  Widget build(BuildContext context) {
    return DetailsView(
      cardItem: cardItem,
    );
  }
}

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.cardItem});

  final CardData cardItem;

  @override
  Widget build(BuildContext context) {
    final image = cardItem.images?.small ?? '';
    final cardName = cardItem.name ?? '';
    final superType = cardItem.supertype;
    final hp = cardItem.hp ?? 100;
    final type = cardItem.types?[0] ?? 'Colorless';

    return ScreenWrapper(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: Text(cardName),
          backgroundColor: primaryColor,
          foregroundColor: textColor,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
          child: Column(
            children: [
              Center(
                child: CachedNetworkImage(
                  imageUrl: image,
                  width: 60.w,
                  height: 70.w,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: 95.w,
                margin: EdgeInsets.only(top: 5.w, bottom: 1.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cardName,
                          style: const TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 2.w,
                        ),
                        Text.rich(
                          TextSpan(
                            text: '$superType - ',
                            style: const TextStyle(color: textColor),
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
                      ],
                    ),
                    Row(
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
                    )
                  ],
                ),
              ),
              const Divider(
                color: textColor,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2.5.w),
                width: 95.w,
                child: const Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        style: TextStyle(color: textColor),
                        text: 'Prices',
                        children: [
                          TextSpan(text: 'TCG Player'),
                          TextSpan(text: 'Card Market'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Prices',
                          style: TextStyle(color: textColor),
                        ),
                        Checkbox(
                          value: true,
                          onChanged: null,
                          activeColor: secondaryColor,
                        ),
                        Text(
                          'TCG Player',
                          style: TextStyle(color: textColor),
                        ),
                        Checkbox(
                          value: true,
                          onChanged: null,
                          activeColor: secondaryColor,
                        ),
                        Text(
                          'Card Market',
                          style: TextStyle(color: textColor),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
