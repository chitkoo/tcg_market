import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/screen_wrapper.dart';
import '../../favourite/favourite.dart';
import '../../market/market.dart';
import '../../utils/values.dart';
import '../cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTabIndex = context.select(
      (HomeCubit cubit) => cubit.state.tab,
    );

    return ScreenWrapper(
      child: Scaffold(
        body: IndexedStack(
          index: currentTabIndex,
          children: const [
            MarketPage(),
            FavouritePage(),
          ],
        ),
        bottomNavigationBar: _NavBar(currentTabIndex: currentTabIndex),
      ),
    );
  }
}

class _NavBar extends StatelessWidget {
  const _NavBar({
    required this.currentTabIndex,
  });

  final int currentTabIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) =>
          context.read<HomeCubit>().setTab(index),
      selectedIndex: currentTabIndex,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      backgroundColor: primaryColor,
      elevation: 0,
      indicatorColor: secondaryColor,
      destinations: const [
        NavigationDestination(
          selectedIcon: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
          label: 'Market',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          icon: Icon(
            Icons.favorite_outline_rounded,
            color: Colors.white,
          ),
          label: 'Favourite',
        ),
      ],
    );
  }
}
