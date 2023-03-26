import 'package:horoscope/features/horoscope/horoscope.dart';
import 'package:horoscope/features/map/map.dart';

final routes = {
  '/': (context) => const FadeThroughTransitionHoroscope(),
  '/finder/map': (context) => const MapScreen()
};
