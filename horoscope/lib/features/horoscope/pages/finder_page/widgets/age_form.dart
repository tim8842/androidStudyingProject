import 'package:flutter/material.dart';

class AgeForm extends StatelessWidget {
  const AgeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15, bottom: 40),
        height: 35,
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                style: Theme.of(context).textTheme.titleSmall,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'От'),
              ),
            ),
            Flexible(
              child: TextField(
                style: Theme.of(context).textTheme.titleSmall,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'До'),
              ),
            )
          ],
        ));
  }
}
