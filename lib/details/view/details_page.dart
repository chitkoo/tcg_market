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
    final tcgLastUpdate = cardItem.tcgplayer?.updatedAt ?? '';
    final cardMarketLastUpdate = cardItem.cardmarket?.updatedAt ?? '';

    return ScreenWrapper(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: Text(cardName),
          backgroundColor: primaryColor,
          foregroundColor: textColor,
          actions: const [],
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () {},
        //   label: const Text('Add to cart'),
        //   icon: const Icon(Icons.shopping_cart_checkout_rounded),
        //   shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        // ),
        floatingActionButton: ElevatedButton(
          onPressed: () {},
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.shopping_cart_checkout_sharp),
              Text('Add to cart'),
            ],
          ),
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
                            color: textColor,
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
                // child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     const Row(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Text(
                //           'Prices',
                //           style: TextStyle(color: textColor),
                //         ),
                //         Checkbox(
                //           value: true,
                //           onChanged: null,
                //           checkColor: textColor,
                //           fillColor: MaterialStatePropertyAll(secondaryColor),
                //         ),
                //         Text(
                //           'TCG Player',
                //           style: TextStyle(color: textColor),
                //         ),
                //         Checkbox(
                //           value: true,
                //           onChanged: null,
                //           checkColor: textColor,
                //           fillColor: MaterialStatePropertyAll(secondaryColor),
                //         ),
                //         Text(
                //           'Card Market',
                //           style: TextStyle(color: textColor),
                //         ),
                //       ],
                //     ),
                //     const Text(
                //       'Buy Now From TCGplayer',
                //       style: TextStyle(
                //         color: secondaryColor,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     SizedBox(
                //       height: 1.w,
                //     ),
                //     Text(
                //       'Last Updated at $tcgLastUpdate',
                //       style: const TextStyle(color: textColor),
                //     ),
                //     SizedBox(
                //       height: 3.w,
                //     ),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             const Text(
                //               'HOLOFOIL MARKET',
                //               style: TextStyle(color: textColor),
                //             ),
                //             SizedBox(
                //               height: 2.5.w,
                //             ),
                //             const Text(
                //               '\$1.6',
                //               style: TextStyle(
                //                 color: normalPriceColor,
                //                 fontSize: 20,
                //               ),
                //             )
                //           ],
                //         ),
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             const Text(
                //               'HOLOFOIL LOW',
                //               style: TextStyle(color: textColor),
                //             ),
                //             SizedBox(
                //               height: 2.5.w,
                //             ),
                //             const Text(
                //               '\$1.6',
                //               style: TextStyle(
                //                 color: lowPriceColor,
                //                 fontSize: 20,
                //               ),
                //             )
                //           ],
                //         ),
                //       ],
                //     ),
                //     SizedBox(
                //       height: 4.w,
                //     ),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             const Text(
                //               'HOLOFOIL MID',
                //               style: TextStyle(color: textColor),
                //             ),
                //             SizedBox(
                //               height: 2.5.w,
                //             ),
                //             const Text(
                //               '\$1.6',
                //               style: TextStyle(
                //                 color: midPriceColor,
                //                 fontSize: 20,
                //               ),
                //             )
                //           ],
                //         ),
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             const Text(
                //               'HOLOFOIL HIGH',
                //               style: TextStyle(color: textColor),
                //             ),
                //             SizedBox(
                //               height: 2.5.w,
                //             ),
                //             const Text(
                //               '\$1.6',
                //               style: TextStyle(
                //                 color: highPriceColor,
                //                 fontSize: 20,
                //               ),
                //             )
                //           ],
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
