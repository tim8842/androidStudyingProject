import 'package:flutter/material.dart';
import 'password_field.dart';

class PasswordForm extends StatelessWidget {
  const PasswordForm({super.key, required this.color, required this.label});
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: PasswordField(
        color: color,
        restorationId: 'password_field',
        textInputAction: TextInputAction.next,
        // focusNode: _password,
        // fieldKey: _passwordFieldKey,
        labelText: label,
        onFieldSubmitted: (value) {
          // setState(() {
          // person.password = value;
          // _retypePassword.requestFocus();
          // });
        },
      ),
    );
  }
}
