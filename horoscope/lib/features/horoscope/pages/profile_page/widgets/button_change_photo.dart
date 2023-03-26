import 'package:flutter/material.dart';

class ButtonChangePhoto extends StatelessWidget {
  const ButtonChangePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
          child: const Text('Редактировать фотографии'),
          onPressed: () {},
        ));
  }
}
