import 'package:flutter/material.dart';

enum Gender { male, female }

class GenderRadios extends StatefulWidget {
  final Color colorTitle;

  const GenderRadios({super.key, required this.colorTitle});

  @override
  // ignore: no_logic_in_create_state
  State<GenderRadios> createState() => _GenderRadios();
}

class _GenderRadios extends State<GenderRadios> {
  Gender? _gender = Gender.male;

  @override
  Widget build(BuildContext context) {
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
                  });
                }),
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _gender = Gender.female;
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
                  });
                }),
          ],
        ));
  }
}
