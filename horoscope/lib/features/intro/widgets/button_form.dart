import 'package:flutter/material.dart';

class ButtonForm extends StatelessWidget {
  const ButtonForm({super.key, this.onPressed, required this.text});
  final String text;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
          onPressed: onPressed
          // Navigator.pushNamed(context, '/registre');
          ,
          child: Text(text)),
    );
  }
}
