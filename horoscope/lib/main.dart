import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'horoscope_app.dart';

int initScreen = 0;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = (prefs.getInt("initScreen"))!;
  // await prefs.setInt("initScreen", 0);
  // debugPrint('initScreen $initScreen');
  runApp(HoroscopeApp(initScreen: initScreen));
}
