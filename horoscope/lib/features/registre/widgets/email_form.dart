import 'package:flutter/material.dart';

class EmailForm extends StatelessWidget {
  final Color color;
  final controller;
  EmailForm({super.key, required this.color, this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        controller: controller,
        style: const TextStyle(fontSize: 20),
        restorationId: 'email_field',
        textInputAction: TextInputAction.next,
        // focusNode: _email,
        decoration: InputDecoration(
            enabledBorder:
                (UnderlineInputBorder(borderSide: BorderSide(color: color))),
            filled: true,
            icon: Icon(
              Icons.email,
              color: color,
            ),
            labelText: 'Email',
            labelStyle: TextStyle(color: color, fontSize: 20)),
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) {
          // controller.text = value;
          // _lifeStory.requestFocus();
        },
      ),
    );
  }
}
