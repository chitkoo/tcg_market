import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/values.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: primaryColor.withOpacity(0.1),
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: child,
      ),
    );
  }
}
