import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:horoscope/features/horoscope/pages/login_page/widgets/widgets.dart';

import '../../../../../functions/createData.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
        // createData(emailController.text);
      } else {
        setState(() {
          error = "Пароли отличаются";
        });
      }
      Navigator.pop(context);
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
            size: 50,
          ),
          const SizedBox(height: 50),
          Text("Давайте создадим аккаунт",
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
          LoginInput(
            controller: confirmPasswordController,
            hintText: 'Повторный пароль',
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          MyButton(
            text: "Зарегистрироваться",
            onTap: signUserUp,
          ),
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
                    "Войти",
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
