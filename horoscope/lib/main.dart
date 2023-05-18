import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'horoscope_app.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

int initScreen = 0;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = (prefs.getInt("initScreen")) ?? 0;
  initScreen = 0;
  await prefs.setInt("initScreen", 0);
  debugPrint('initScreen $initScreen');
  if (FirebaseAuth.instance.currentUser != null) {
    initScreen = 1;
  }
  runApp(HoroscopeApp(initScreen: initScreen));
}
