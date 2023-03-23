import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';

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

  final _appBarTitleList = [
    'Гороскоп',
    'Совместимость',
    'Поиск',
    'Профиль',
    'Настройки'
  ];

  final _pageList = <Widget>[
    _HoroscopesPage(),
    _LovePage(),
    _FinderPage(),
    _ProfilePage(),
    _SettingsPage()
  ];

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
          title: Text(_appBarTitleList[_currentIndex],
              style: Theme.of(context).textTheme.titleMedium)),
      body: Center(child: _pageList[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (selectedIndex) {
          setState(() {
            _currentIndex = selectedIndex;
          });
        },
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

class _HoroscopesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.brown,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/aquarius.svg', height: 20),
                        Text('  Водолей',
                            style: Theme.of(context).textTheme.titleSmall)
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: const ReadMoreText(
                          'Начало дня будет благоприятным с точки зрения личных отношений, подойдет для встречи с человеком, которому вы хотели бы понравиться. Не исключены романтические сюрпризы, некоторые Водолеи услышат слова, которых давно ждали. А еще в это время хорошо строить планы и обсуждать их с самыми близкими.',
                          trimLines: 4,
                          colorClickableText: Colors.pink,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: '\n Читать ещё',
                          trimExpandedText: '\n Свернуть',
                          moreStyle: TextStyle(
                            fontSize: 13,
                            height: 1.9,
                            fontWeight: FontWeight.bold,
                          ),
                          lessStyle: TextStyle(
                            fontSize: 13,
                            height: 1.9,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    height: 100,
                    child: Text('Grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ));
  }
}

class _LovePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('go to love'),
    );
  }
}

class _FinderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('go to finder'),
    );
  }
}

class _ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('go to profile'),
    );
  }
}

class _SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('go to settings'),
    );
  }
}
