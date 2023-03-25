import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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
        '/finder/map': (context) => const _MapScreem()
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
  // final _formsList = <Widget>[
  //   _OldForm(),
  //   _OldForm(),
  //   _OldForm(),
  //   _OldForm(),
  //   _OldForm()
  // ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
              color: Colors.indigo[800],
              child: Form(
                  child: Column(children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0, color: Colors.white),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.white),
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    alignment: Alignment.topLeft,
                    child: const Text(
                        'Здесь вы можете искать подходящих вам по гороскопу людей, напишите кого вы желаете найти')),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0, color: Colors.white),
                        color: Colors.white),
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Возраст',
                              style: Theme.of(context).textTheme.titleSmall),
                          _AgeForm(),
                          Text('Пол',
                              style: Theme.of(context).textTheme.titleSmall),
                          const GenderRadios(),
                          Text('Создвездие',
                              style: Theme.of(context).textTheme.titleSmall),
                          const DropdownButtonConstellation(),
                          Text('Радиус поиска',
                              style: Theme.of(context).textTheme.titleSmall),
                          const ButtonsRadioForm(),
                        ])),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0, color: Colors.white),
                      color: Colors.white),
                  padding: const EdgeInsets.fromLTRB(40, 5, 40, 20),
                  child: _ButtonSearch(),
                )
              ]))),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(color: Colors.white),
        )
      ],
    );
  }
}
// Container(
//         color: Colors.indigo[800],
//         child: Form(
//             child: Column(children: [
//           Container(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10)),
//                   color: Colors.white),
//               margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//               padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//               alignment: Alignment.topLeft,
//               child: const Text(
//                   'Здесь вы можете искать подходящих вам по гороскопу людей, напишите кого вы желаете найти')),
//           Expanded(
//               child: Container(
//                   color: Colors.white,
//                   alignment: Alignment.topLeft,
//                   padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Возраст',
//                             style: Theme.of(context).textTheme.titleSmall),
//                         _AgeForm(),
//                         Text('Пол',
//                             style: Theme.of(context).textTheme.titleSmall),
//                         const GenderRadios(),
//                         Text('Создвездие',
//                             style: Theme.of(context).textTheme.titleSmall),
//                         const DropdownButtonConstellation(),
//                         Text('Радиус поиска',
//                             style: Theme.of(context).textTheme.titleSmall),
//                         const ButtonsRadioForm(),
//                         _ButtonSearch()
//                       ])))
//         ])))

class _AgeForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15, bottom: 40),
        height: 35,
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                style: Theme.of(context).textTheme.titleSmall,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'От'),
              ),
            ),
            Flexible(
              child: TextField(
                style: Theme.of(context).textTheme.titleSmall,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'До'),
              ),
            )
          ],
        ));
  }
}

enum Gender { male, female }

class GenderRadios extends StatefulWidget {
  const GenderRadios({super.key});

  @override
  State<GenderRadios> createState() => _GenderRadios();
}

class _GenderRadios extends State<GenderRadios> {
  Gender? _gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 40),
        height: 35,
        child: Row(
          children: <Widget>[
            const Flexible(
              child: Text('Мужчина'),
            ),
            Radio<Gender>(
                value: Gender.male,
                groupValue: _gender,
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value;
                  });
                }),
            const Flexible(
              child: Text('Женщина'),
            ),
            Radio<Gender>(
                value: Gender.female,
                groupValue: _gender,
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value;
                  });
                }),
          ],
        ));
  }
}

class DropdownButtonConstellation extends StatefulWidget {
  const DropdownButtonConstellation({super.key});

  @override
  State<DropdownButtonConstellation> createState() =>
      _DropdownButtonConstellationState();
}

class CustomDropdownButton2 extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;

  const CustomDropdownButton2({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset = const Offset(0, 0),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        //To avoid long text overflowing.
        isExpanded: true,
        hint: Container(
          alignment: hintAlignment,
          child: Text(
            hint,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
        value: value,
        items: dropdownItems
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Container(
                    alignment: valueAlignment,
                    child: Text(
                      item,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ))
            .toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        buttonStyleData: ButtonStyleData(
          height: buttonHeight ?? 40,
          width: buttonWidth ?? 140,
          padding: buttonPadding ?? const EdgeInsets.only(left: 14, right: 14),
          decoration: buttonDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black45,
                ),
              ),
          elevation: buttonElevation,
        ),
        iconStyleData: IconStyleData(
          icon: icon ?? const Icon(Icons.arrow_forward_ios_outlined),
          iconSize: iconSize ?? 12,
          iconEnabledColor: iconEnabledColor,
          iconDisabledColor: iconDisabledColor,
        ),
        dropdownStyleData: DropdownStyleData(
          //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
          maxHeight: dropdownHeight ?? 200,
          width: dropdownWidth ?? 140,
          padding: dropdownPadding,
          decoration: dropdownDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
          elevation: dropdownElevation ?? 8,
          //Null or Offset(0, 0) will open just under the button. You can edit as you want.
          offset: offset,
          //Default is false to show menu below button
          isOverButton: false,
          scrollbarTheme: ScrollbarThemeData(
            radius: scrollbarRadius ?? const Radius.circular(40),
            thickness: scrollbarThickness != null
                ? MaterialStateProperty.all<double>(scrollbarThickness!)
                : null,
            thumbVisibility: scrollbarAlwaysShow != null
                ? MaterialStateProperty.all<bool>(scrollbarAlwaysShow!)
                : null,
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: itemHeight ?? 40,
          padding: itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}

class _DropdownButtonConstellationState
    extends State<DropdownButtonConstellation> {
  final List<String> items = [
    'Овен',
    'Телец',
    'Близнецы',
    'Рак',
    'Лев',
    'Дева',
    'Весы',
    'Скорпион',
    'Стрелец',
    'Козерог',
    'Водолей',
    'Рыбы'
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 40),
      child: CustomDropdownButton2(
        hint: 'Выберите ',
        dropdownItems: items,
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
      ),
    );
    //   return DropdownButton<String>(
    //     value: dropdownValue,
    //     icon: const Icon(
    //       Icons.arrow_downward,
    //       size: 18,
    //     ),
    //     elevation: 16,
    //     style: const TextStyle(color: Colors.deepPurple),
    //     underline: Container(
    //       height: 2,
    //       color: Colors.deepPurpleAccent,
    //     ),
    //     onChanged: (String? value) {
    //       // This is called when the user selects an item.
    //       setState(() {
    //         dropdownValue = value!;
    //       });
    //     },
    //     items: list.map<DropdownMenuItem<String>>((String value) {
    //       return DropdownMenuItem<String>(
    //         value: value,
    //         child: Text(value),
    //       );
    //     }).toList(),
    //   );
    // }
  }
}

class ButtonsRadioForm extends StatefulWidget {
  const ButtonsRadioForm({super.key});
  @override
  State<ButtonsRadioForm> createState() => _ButtonsRadioFormState();
}

/// This is the private State class that goes with ButtonsRadioForm.
class _ButtonsRadioFormState extends State<ButtonsRadioForm> {
  int value = 0;
  Widget customRadioButton(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          value = index;
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: (value == index) ? Colors.blue : Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 0),
        child: Row(
          children: <Widget>[
            Expanded(child: customRadioButton("100 м", 1)),
            Expanded(child: customRadioButton("500 м", 2)),
            Expanded(child: customRadioButton("1 км", 3))
          ],
        ));
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

class _ButtonSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(children: [
      Expanded(
          child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/finder/map');
        },
        child: const Text('Поиск'),
      )),
    ]));
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

class _MapScreem extends StatelessWidget {
  const _MapScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map screen')),
    );
  }
}
