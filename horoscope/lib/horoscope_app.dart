import 'package:flutter/material.dart';
import 'package:horoscope/router/router.dart';
import 'package:horoscope/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class HoroscopeApp extends StatelessWidget {
  final int initScreen;

  const HoroscopeApp({super.key, required this.initScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ru')],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: defualtTheme,
      initialRoute: initScreen == 0 ? "/intro" : "/",
      routes: routes,
    );
  }
}
