import 'package:flutter/material.dart';
import 'package:horoscope/features/intro/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _nameController = TextEditingController();

  final _birthdayController = TextEditingController();

  final _genderController = TextEditingController(text: 'female');

  String error = '';

  void changeWelcomePage(context) async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("initScreen", 1);
    Navigator.pushNamed(context, '/registre');
  }

  void setData(context, List<String> name, List<String> value) async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var i = 0; i < name.length; i++) {
      if (value[i] != '') {
        await prefs.setString(name[i], value[i]);
        setState(() {
          error = '';
        });
      } else {
        setState(() {
          error = 'Заполните поля';
        });
        return;
      }
    }
    changeWelcomePage(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _birthdayController.dispose();
    _genderController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Здравствуйте',
                style: Theme.of(context).textTheme.titleMedium)),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/jpg/cosmose.jpg'),
                    fit: BoxFit.cover)),
            child: Center(
                child: SingleChildScrollView(
              child: Form(
                child: Container(
                  margin: const EdgeInsets.all(30),
                  width: 400,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Введите информацию о вас',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          error,
                          style: const TextStyle(color: Colors.red),
                        ),
                        const SizedBox(height: 10),
                        NameForm(controller: _nameController),
                        const SizedBox(height: 30),
                        BasicDateField(
                            colorTitle: Colors.white,
                            controller: _birthdayController),
                        const SizedBox(height: 30),
                        GenderRadios(
                          colorTitle: Colors.white,
                          controller: _genderController,
                        ),
                        const SizedBox(height: 30),
                        ButtonForm(
                          onPressed: () => {
                            setData(context, [
                              'name',
                              'birthday',
                              'gender'
                            ], [
                              _nameController.text,
                              _birthdayController.text,
                              _genderController.text
                            ]),
                          },
                          text: 'Далее',
                        )
                      ]),
                ),
              ),
            )),
          ),
        ));
  }
}

// Navigator.pushNamed(context, '/registre')