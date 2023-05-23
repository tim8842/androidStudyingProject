// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

enum Gender { male, female }

class GenderRadios extends StatefulWidget {
  final Color colorTitle;
  final controller;

  const GenderRadios({super.key, required this.colorTitle, this.controller});

  @override
  // ignore: no_logic_in_create_state
  State<GenderRadios> createState() => _GenderRadios(controller);
}

class _GenderRadios extends State<GenderRadios> {
  Gender? _gender = Gender.male;
  final controller;

  _GenderRadios(this.controller);

  @override
  Widget build(BuildContext context) {
    if (controller.text == 'male') {
      _gender = Gender.male;
    } else {
      _gender = Gender.female;
    }
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20),
        height: 35,
        child: Row(
          children: <Widget>[
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _gender = Gender.male;
                    controller.text = 'male';
                  });
                },
                child: Text('Мужчина',
                    style: TextStyle(
                        color: widget.colorTitle,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Radio<Gender>(
                fillColor: MaterialStateColor.resolveWith(
                    (states) => widget.colorTitle),
                value: Gender.male,
                groupValue: _gender,
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value;
                    controller.text = 'male';
                  });
                }),
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _gender = Gender.female;
                    controller.text = 'female';
                  });
                },
                child: Text('Женщина',
                    style: TextStyle(
                        color: widget.colorTitle,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Radio<Gender>(
                fillColor: MaterialStateColor.resolveWith(
                    (states) => widget.colorTitle),
                value: Gender.female,
                groupValue: _gender,
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value;
                    controller.text = 'female';
                  });
                }),
          ],
        ));
  }
}
