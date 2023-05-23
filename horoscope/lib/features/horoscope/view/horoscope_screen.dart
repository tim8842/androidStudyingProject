import 'package:flutter/material.dart';
import 'package:horoscope/features/horoscope/pages/auth_page/view/auth_page.dart';
import 'package:horoscope/features/horoscope/pages/pages.dart';

class FadeThroughTransitionHoroscope extends StatefulWidget {
  const FadeThroughTransitionHoroscope({super.key});

  @override
  State<StatefulWidget> createState() => _FadeThroughTransitionHoroscopeState();
}

class _FadeThroughTransitionHoroscopeState
    extends State<FadeThroughTransitionHoroscope> {
  int _currentIndex = 0;
  bool endSet = false;
  bool inProfile = false;
  final _appBarTitleList = [
    'Гороскоп',
    'Совместимость',
    'Поиск',
    'Профиль',
    'Настройки'
  ];

  final _pageList = <Widget>[
    const HoroscopesPage(),
    const LovePage(),
    const FinderPage(),
    const AuthPage(),
    const SettingsPage()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   HoroscopeService().getHoroscopeList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(_appBarTitleList[_currentIndex],
              style: Theme.of(context).textTheme.titleMedium)),
      body: SafeArea(child: Center(child: _pageList[_currentIndex])),
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
