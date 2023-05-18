import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:horoscope/features/horoscope/pages/auth_page/view/auth_page.dart';
import 'package:horoscope/features/horoscope/pages/login_or_register_page/view/login_or_register_page.dart';
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

  // void setControllers() async {
  //   if (FirebaseAuth.instance.currentUser != null) {
  //     setState(() {
  //       endSet = false;
  //     });
  //     CollectionReference db = FirebaseFirestore.instance.collection('users');
  //     String? email = FirebaseAuth.instance.currentUser?.email;
  //     final docSnap = db.doc(email);
  //     Map<String, dynamic> data;
  //     docSnap.get().then((value) => {
  //           if (value.exists)
  //             {
  //               data = value.data() as Map<String, dynamic>,
  //               _nameController.text = data['name'],
  //               _genderController.text = data['gender'],
  //               _surnameController.text = data['surname'],
  //               _birthdayController.text = data['birthday'],
  //               _countryController.text = data['country'],
  //               _cityController.text = data['city'],
  //               _stateController.text = data['state'],
  //               _informationController.text = data['information'],
  //               print(data['name']),
  //               print(_genderController),
  //               setState(() {
  //                 endSet = true;
  //               })
  //             }
  //           else
  //             {
  //               setState(() {
  //                 endSet = true;
  //               }),
  //               updateDatabase()
  //             }
  //         });
  //   }
  // }

  // void updateDatabase() async {
  //   CollectionReference db = FirebaseFirestore.instance.collection('users');
  //   String? email = FirebaseAuth.instance.currentUser?.email;
  //   final docSnap = db.doc(email);
  //   docSnap
  //       .set({
  //         'name': _nameController.text,
  //         'surname': _surnameController.text,
  //         'gender': _genderController.text,
  //         'birthday': _birthdayController.text,
  //         'country': _countryController.text,
  //         'state': _stateController.text,
  //         'city': _cityController.text,
  //         'information': _informationController.text
  //       })
  //       .then((value) => print('added'))
  //       .catchError((error) => print('Add failed: $error'));
  //   // if (docSnap == null) {
  //   //   print('net elementa');
  //   // }
  // }

  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _genderController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _countryController = TextEditingController(text: "Choose Country");
  final _stateController = TextEditingController(text: "Choose State");
  final _cityController = TextEditingController(text: "Choose City");
  final _informationController = TextEditingController();

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
    // setControllers();
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
