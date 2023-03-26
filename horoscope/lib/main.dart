import 'package:flutter/material.dart';

import 'features/horoscope/horoscope.dart';
import 'features/map/map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          textTheme: const TextTheme(
            titleMedium: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500),
            titleSmall: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          )),
      routes: {
        '/': (context) => const FadeThroughTransitionHoroscope(),
        '/finder/map': (context) => const MapScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('ho to')));
  }
}
