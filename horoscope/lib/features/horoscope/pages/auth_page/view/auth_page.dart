import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:horoscope/features/horoscope/pages/profile_page/view/profile_page.dart';
import 'package:horoscope/features/horoscope/pages/login_or_register_page/view/login_or_register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (!snapshot.hasData) {
          return const LoginOrRegisterPage();
        }
        return ProfilePage(snapshot: snapshot);
      },
    );
  }
}
