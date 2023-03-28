import 'package:flutter/material.dart';
import 'package:horoscope/features/registre/widgets/widgets.dart';

class RegistreScreen extends StatelessWidget {
  const RegistreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Регистрация',
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
                      const Text('Создайте аккаунт',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      const SizedBox(height: 30),
                      const EmailForm(
                        color: Colors.white,
                      ),
                      const SizedBox(height: 30),
                      const PasswordForm(
                        color: Colors.white,
                        label: 'Пароль',
                      ),
                      const PasswordForm(
                        color: Colors.white,
                        label: 'Повторный пароль',
                      ),
                      const SizedBox(height: 30),
                      ButtonForm(
                        onPressed: () => Navigator.of(context).pushNamed('/'),
                        text: 'Далее',
                      ),
                      const SizedBox(height: 15),
                      AHref(
                          text: 'Пропустить',
                          color: Colors.white,
                          onTap: () => Navigator.of(context).pushNamed('/'))
                    ]),
              ),
            ),
          )),
        ));
  }
}
