import 'package:flutter/material.dart';
import 'package:horoscope/router/router.dart';
import 'package:horoscope/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class HoroscopeApp extends StatelessWidget {
  const HoroscopeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ru')],
      title: 'Flutter Demo',
      theme: defualtTheme,
      routes: routes,
    );
  }
}
