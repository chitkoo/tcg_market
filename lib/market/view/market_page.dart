import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/screen_wrapper.dart';
import '../../utils/colors.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MarketView();
  }
}

class MarketView extends StatelessWidget {
  const MarketView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          systemNavigationBarColor: primaryColor,
        ),
        child: Scaffold(
          appBar: AppBar(title: const Text('Market')),
        ),
      ),
    );
  }
}
