import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'horoscope_app.dart';

int initScreen = 0;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = (prefs.getInt("initScreen")) ?? 0;
  // await prefs.setInt("initScreen", 0);
  // debugPrint('initScreen $initScreen');
  runApp(HoroscopeApp(initScreen: initScreen));
}
