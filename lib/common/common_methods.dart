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
}
