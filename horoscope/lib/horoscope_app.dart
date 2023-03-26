import 'package:flutter/material.dart';
import 'package:horoscope/router/router.dart';
import 'package:horoscope/theme/theme.dart';

class HoroscopeApp extends StatelessWidget {
  const HoroscopeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: defualtTheme,
      routes: routes,
    );
  }
}
