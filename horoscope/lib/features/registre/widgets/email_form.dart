import 'package:flutter/material.dart';

class EmailForm extends StatelessWidget {
  const EmailForm({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
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
          // person.email = value;
          // _lifeStory.requestFocus();
        },
      ),
    );
  }
}
