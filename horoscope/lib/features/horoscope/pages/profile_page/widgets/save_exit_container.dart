import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SaveExitContainer extends StatelessWidget {
  const SaveExitContainer({super.key, this.saveFunction});
  final saveFunction;

  void sighUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        ElevatedButton(
            onPressed: () {
              saveFunction();
              // HoroscopeService().getHoroscopeList();
            },
            child: const Text('Сохранить')),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: sighUserOut,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          child: const Text('Выход'),
        ),
      ]),
    );
  }
}
