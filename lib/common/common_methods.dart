import 'package:flutter/material.dart';

class CommonMethods {
  static PageRouteBuilder<dynamic> buildPageRoute({required Widget page}) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: page,
        );
      },
    );
  }

  static AssetImage getDecoImageWidget(String type) {
    switch (type) {
      case 'Colorless':
        return const AssetImage('assets/images/colorless.png');
      case 'Darkness':
        return const AssetImage('assets/images/darkness.png');
      case 'Dragon':
        return const AssetImage('assets/images/dragon.png');
      case 'Fairy':
        return const AssetImage('assets/images/fairy.png');
      case 'Fighting':
        return const AssetImage('assets/images/fighting.png');
      case 'Fire':
        return const AssetImage('assets/images/fire.png');
      case 'Grass':
        return const AssetImage('assets/images/grass.png');
      case 'Lightning':
        return const AssetImage('assets/images/lightning.png');
      case 'Metal':
        return const AssetImage('assets/images/metal.png');
      case 'Psychic':
        return const AssetImage('assets/images/psychic.png');
      case 'Water':
        return const AssetImage('assets/images/water.png');

      default:
        return const AssetImage('assets/images/colorless.png');
    }
  }
}
