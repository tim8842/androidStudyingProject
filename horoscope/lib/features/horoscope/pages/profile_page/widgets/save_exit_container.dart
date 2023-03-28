import 'package:flutter/material.dart';
import 'package:horoscope/services/horoscope/horoscope_service.dart';

class SaveExitContainer extends StatelessWidget {
  const SaveExitContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        ElevatedButton(
            onPressed: () {
              HoroscopeService().getHoroscopeList();
            },
            child: const Text('Сохранить')),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () {
            // Navigator.pushNamed(context, '/intro');
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          child: const Text('Выход'),
        ),
      ]),
    );
  }
}
