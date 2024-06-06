import 'package:flutter/material.dart';

import 'package:foodhub/Screens/Splash.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
        theme: ThemeData(),
      );
    });
  }
}
