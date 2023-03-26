import 'package:flutter/material.dart';

enum Gender { male, female }

class GenderRadios extends StatefulWidget {
  const GenderRadios({super.key});

  @override
  State<GenderRadios> createState() => _GenderRadios();
}

class _GenderRadios extends State<GenderRadios> {
  Gender? _gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 40),
        height: 35,
        child: Row(
          children: <Widget>[
            const Flexible(
              child: Text('Мужчина'),
            ),
            Radio<Gender>(
                value: Gender.male,
                groupValue: _gender,
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value;
                  });
                }),
            const Flexible(
              child: Text('Женщина'),
            ),
            Radio<Gender>(
                value: Gender.female,
                groupValue: _gender,
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value;
                  });
                }),
          ],
        ));
  }
}
