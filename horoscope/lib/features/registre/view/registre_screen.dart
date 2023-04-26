import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:horoscope/features/registre/widgets/widgets.dart';

class RegistreScreen extends StatefulWidget {
  const RegistreScreen({super.key});

  @override
  State<RegistreScreen> createState() => _RegistreScreenState();
}

class _RegistreScreenState extends State<RegistreScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String error = "";

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        setState(() {
          error = "Пароли отличаются";
        });
      }
      Navigator.pop(context);
      Navigator.of(context).pushNamed('/');
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if ((e.code == 'user-not-found') || (e.code == 'invalid-email')) {
        setState(() {
          error = "Почты либо не существует, либо ввели неверно";
        });
      } else if (e.code == 'unknown') {
        setState(() {
          error = "Заполните поля";
        });
      } else if (e.code == 'weak-password') {
        setState(() {
          error = "Слабый пароль, введите больше 6 символов";
        });
      } else {
        setState(() {
          error = "";
        });
      }
    }
  }

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
                      EmailForm(
                        color: Colors.white,
                        controller: emailController,
                      ),
                      const SizedBox(height: 30),
                      PasswordForm(
                        controller: passwordController,
                        color: Colors.white,
                        label: 'Пароль',
                      ),
                      PasswordForm(
                        controller: confirmPasswordController,
                        color: Colors.white,
                        label: 'Повторный пароль',
                      ),
                      const SizedBox(height: 30),
                      ButtonForm(
                        onPressed: signUserUp,
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
