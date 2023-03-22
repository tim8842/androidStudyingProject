import 'package:flutter/material.dart';

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
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w500))),
      home: const FadeThroughTransitionHoroscope(),
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

class FadeThroughTransitionHoroscope extends StatefulWidget {
  const FadeThroughTransitionHoroscope({super.key});

  @override
  State<StatefulWidget> createState() => _FadeThroughTransitionHoroscopeState();
}

class _FadeThroughTransitionHoroscopeState
    extends State<FadeThroughTransitionHoroscope> {
  int _currentIndex = 0;

  final _pageList = <Widget>[_horoscopesPage(), _horoscopesPage()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title:
              Text('Гороскоп', style: Theme.of(context).textTheme.titleMedium)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('assets/png/horoscopeNonActive.png'),
              label: '',
              activeIcon: Image.asset('assets/png/horoscopeActive.png')),
          BottomNavigationBarItem(
              icon: Image.asset('assets/png/loveNonActive.png'),
              label: '',
              activeIcon: Image.asset('assets/png/loveActive.png')),
          BottomNavigationBarItem(
              icon: Image.asset('assets/png/finderNonActive.png'),
              label: '',
              activeIcon: Image.asset('assets/png/finderActive.png')),
          BottomNavigationBarItem(
              icon: Image.asset('assets/png/profileNonActive.png'),
              label: '',
              activeIcon: Image.asset('assets/png/profileActive.png')),
          BottomNavigationBarItem(
              icon: Image.asset('assets/png/settingsNonActive.png'),
              label: '',
              activeIcon: Image.asset('assets/png/settingsActive.png')),
        ],
      ),
    );
  }
}

class _horoscopesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('go to home'),
    );
  }
}
