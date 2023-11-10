import 'package:cards_list_repository/cards_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:tcg_market/common/screen_wrapper.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.cardItem,
  });

  final CardData cardItem;

  @override
  Widget build(BuildContext context) {
    return const DetailsView();
  }
}

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
        ),
      
      ),
    );
  }
}
