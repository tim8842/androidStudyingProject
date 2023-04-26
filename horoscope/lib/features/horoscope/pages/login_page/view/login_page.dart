import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:horoscope/features/horoscope/horoscope.dart';
import 'package:horoscope/features/horoscope/pages/login_page/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  String error = "";

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (_) => FadeThroughTransitionHoroscope()));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if ((e.code == 'user-not-found') || (e.code == 'invalid-email')) {
        setState(() {
          error = "Почты либо не существует, либо ввели неверно";
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          error = "Неверный пароль";
        });
      } else if (e.code == 'unknown') {
        setState(() {
          error = "Заполните поля";
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
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: SingleChildScrollView(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 50),
          const Icon(
            Icons.lock,
            size: 100,
          ),
          const SizedBox(height: 50),
          Text("Добро пожаловать, мы скучали",
              style: TextStyle(color: Colors.grey[700], fontSize: 16)),
          const SizedBox(height: 20),
          Text(
            error,
            style: TextStyle(color: Colors.red, fontSize: 10),
          ),
          const SizedBox(height: 10),
          LoginInput(
            controller: emailController,
            hintText: 'Почта',
            obscureText: false,
          ),
          const SizedBox(
            height: 10,
          ),
          LoginInput(
            controller: passwordController,
            hintText: 'Пароль',
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Text(
                  'Забыли пароль?',
                  style: TextStyle(color: Colors.grey[600]),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MyButton(onTap: signUserIn, text: 'Войти'),
          Row(
            children: [
              Expanded(
                  child: Divider(
                thickness: 0.5,
                color: Colors.grey[400],
              ))
            ],
          ),
          Padding(
            padding: EdgeInsets.all(25),
            child: Row(
              children: [
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Зарегистрироваться",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ])),
      ),
    );
  }
}
