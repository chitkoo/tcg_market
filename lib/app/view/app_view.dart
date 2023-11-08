import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../home/view/home_page.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (_, __, ___) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            textTheme: GoogleFonts.montserratTextTheme(),
            appBarTheme: const AppBarTheme(centerTitle: true),
          ),
          builder: (context, child) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              data: data.copyWith(textScaleFactor: 1),
              child: child!,
            );
          },
          home: const HomePage(),
        );
      },
    );
  }
}
