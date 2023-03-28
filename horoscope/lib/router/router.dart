import 'package:horoscope/features/horoscope/horoscope.dart';
import 'package:horoscope/features/map/map.dart';
import 'package:horoscope/features/intro/intro.dart';
import 'package:horoscope/features/registre/registre.dart';

final routes = {
  '/': (context) => const FadeThroughTransitionHoroscope(),
  '/finder/map': (context) => const MapScreen(),
  '/intro': (context) => const IntroScreen(),
  '/registre': (context) => const RegistreScreen(),
};
