import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:horoscope/features/horoscope/pages/horoscope_page/widgets/widgets.dart';
import 'package:horoscope/functions/getHoroscope.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HoroscopesPage extends StatefulWidget {
  HoroscopesPage({super.key});

  @override
  State<HoroscopesPage> createState() => _HoroscopesPageState();
}

class _HoroscopesPageState extends State<HoroscopesPage> {
  bool endSet = false;
  int horPeriodIndex = 0;
  final horoscopeList = ['', ''];
  final picturesPathsList = [
    'assets/png/love.png',
    'assets/png/business.png',
    'assets/png/man.png',
    'assets/png/woman.png',
    'assets/png/sex.png'
  ];
  String horoscope = '';
  final titlesList = ['Любовь', 'Финансы', 'Мужской', 'Женский', 'Секс'];
  String headerInfo = 'header infasdasdadasdasassssssssssssssssso';
  final textDescriptionList = [
    [
      'В этот день ключом к любовной гармонии Водолеев может стать не романтический интерес, а увлекательное общение. Им будет проще начинать или поддерживать отношения в процессе обмена новостями, шутками или идеями. Занимательная беседа или совместная поездка способна отвлечь их от сложных сторон любви.',
      'У Водолеев это удачный день для выполнения повседневных дел и обязанностей. Благодаря трудолюбию и мастерству ваша производительность труда может существенно вырасти. Это хорошее время для повышения уровня профессионализма. Однако звезды советуют вам осмотрительнее обращаться с поступающей информацией – вам могут поступить ложные сведения.',
      'День призывает Водолеев к спокойствию и умиротворённости. Не стоит сегодня заниматься выполнением рабочих дел, решением серьёзных финансовых и имущественных вопросов. Постарайтесь ненадолго отвлечься от интенсивного ритма жизни, позволив себе кратковременный отдых. В общении с другими людьми важно прислушиваться к чужому мнению, но также уметь отстаивать и свои убеждения. Возможна расточительность, желание себя побаловать - что ж, не стоит себе в этом отказывать, если есть соответствующая возможность.',
      'В течение дня женщинам-Водолеям удастся преодолеть все препятствия и вновь оказаться «на гребне волны». Не исключено, что вам придется бороться с невидимым врагом — например, с утечкой средств, отсутствием порядка, собственной душевной слабостью. Возможно, будет нелегко избавиться от ненужных, но памятных вещей. Душевное равновесие и оптимизм вам вернет финансовая удача, романтическое событие, хорошее известие, удачное стечение обстоятельств. Любые акции лучше отложить до вечера, или перенести на завтра.',
      'Вы слишком много проводите время онлайн и слишком мало в постели с любимым. Как часто во время секса у вас мелькала мысль о том, лайкнул ли кто-то вашу публикацию? А сколько раз вы отвлекались на звук сработавшего мессенджера? Если вы хотите снова наладить вашу интимную жизнь, — точно откажитесь от использования гаджетов хотя бы за час до того, как идти в постель.'
    ],
    ['', '', '', '', ''],
    ['', '', '', '', '']
  ];

  void getBirthday() async {
    setState(() {
      endSet = false;
    });
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      CollectionReference db = FirebaseFirestore.instance.collection('users');
      final email = currentUser.email;
      final docSnap = db.doc(email);
      Map<String, dynamic> data;
      docSnap.get().then((value) {
        data = value.data() as Map<String, dynamic>;
        setState(() {
          horoscope = data['birthday'];
          endSet = true;
        });
        if (horoscope != '') {
          changeListToHoroscope(horoscope);
          print(horoscopeList);
        } else
          errorSetState();
      });
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setString("birthday", '');
      String? name = ((prefs.getString("birthday")) ?? 0) as String?;
      if (name != null && name != '') {
        setState(() {
          horoscope = name;
          endSet = true;
        });
        changeListToHoroscope(horoscope);
        print(horoscopeList);
      } else
        errorSetState();
    }
  }

  void changeListToHoroscope(String date) {
    DateFormat format = DateFormat("dd-MM-yyyy");
    DateTime dateOfBirth = format.parse(date);
    List<String> tmpHorLst = getHoroscope(dateOfBirth);
    horoscopeList[0] = tmpHorLst[0];
    horoscopeList[1] = tmpHorLst[1];
  }

  void errorSetState() {
    setState(() {
      horoscopeList[1] = "Ошибка";
      horoscopeList[0] = 'error';
      headerInfo = "войдите/зарегистрируйте в аккаунт и укажите дату";
      endSet = true;
    });
  }

  @override
  void initState() {
    getBirthday();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!endSet)
      return const Center(
        child: CircularProgressIndicator(),
      );
    else {
      return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/jpg/cosmose.jpg'),
                  fit: BoxFit.cover)),
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
                          SvgPicture.asset(getHoroscopeSvg(horoscopeList[0]),
                              height: 20),
                          Text('  ${horoscopeList[1]}',
                              style: Theme.of(context).textTheme.titleSmall)
                        ],
                      ),
                      HeaderHoroscope(
                        text: headerInfo,
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: Container(
                      margin: const EdgeInsets.all(15),
                      height: 35,
                      child: BarSliderSegment(
                        valueChangedFunc: (int newIndex) => {
                          setState(() {
                            horPeriodIndex = newIndex;
                          })
                        },
                      ))),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color.fromRGBO(58, 93, 239, 1),
                      ),
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 30),
                      child: AllHoroscope(
                        colorText: Colors.white,
                        title: titlesList[index],
                        iconPath: picturesPathsList[index],
                        textDescription: textDescriptionList[horPeriodIndex]
                            [index],
                      ),
                    );
                  },
                  childCount: 5,
                ),
              ),
            ],
          ));
    }
  }
}
