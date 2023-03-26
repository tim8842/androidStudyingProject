import 'package:flutter/material.dart';

class ButtonSearch extends StatelessWidget {
  const ButtonSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(children: [
      Expanded(
          child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/finder/map');
        },
        child: const Text('Поиск'),
      )),
    ]));
  }
}
