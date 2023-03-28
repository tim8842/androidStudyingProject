import 'package:flutter/material.dart';
import 'package:horoscope/features/intro/widgets/widgets.dart';

class RegistreScreen extends StatelessWidget {
  const RegistreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Здравствуйте',
                style: Theme.of(context).textTheme.titleMedium)),
        body: Container(
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
                      const NameForm(),
                      const SizedBox(height: 30),
                      BasicDateField(colorTitle: Colors.white),
                      const SizedBox(height: 30),
                      const GenderRadios(colorTitle: Colors.white),
                      const SizedBox(height: 30),
                      const ButtonForm()
                    ]),
              ),
            ),
          )),
        ));
  }
}
