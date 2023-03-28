import 'package:flutter/material.dart';

class NameForm extends StatelessWidget {
  const NameForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        style: const TextStyle(fontSize: 20),
        restorationId: 'name_field',
        textInputAction: TextInputAction.next,
        textCapitalization: TextCapitalization.words,
        decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            filled: true,
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            labelText: 'Имя',
            labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
        onSaved: (value) {},
      ),
    );
  }
}
