import 'package:flutter/material.dart';

class ButtonsRadioForm extends StatefulWidget {
  const ButtonsRadioForm({super.key});
  @override
  State<ButtonsRadioForm> createState() => _ButtonsRadioFormState();
}

/// This is the private State class that goes with ButtonsRadioForm.
class _ButtonsRadioFormState extends State<ButtonsRadioForm> {
  int value = 0;
  Widget customRadioButton(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          value = index;
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: (value == index) ? Colors.blue : Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 0),
        child: Row(
          children: <Widget>[
            Expanded(child: customRadioButton("100 м", 1)),
            Expanded(child: customRadioButton("500 м", 2)),
            Expanded(child: customRadioButton("1 км", 3))
          ],
        ));
  }
}
