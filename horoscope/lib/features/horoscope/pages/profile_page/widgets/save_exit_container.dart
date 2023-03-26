import 'package:flutter/material.dart';

class SaveExitContainer extends StatelessWidget {
  const SaveExitContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        ElevatedButton(onPressed: () {}, child: const Text('Сохранить')),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          child: const Text('Выход'),
        ),
      ]),
    );
  }
}
