import 'package:flutter/material.dart';

class InputFio extends StatelessWidget {
  const InputFio({super.key});

  Widget customInput(BuildContext context, String hintName) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            labelText: hintName,
            labelStyle: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          customInput(context, 'Имя'),
          const SizedBox(
            height: 20,
          ),
          customInput(context, 'Фамилия'),
        ],
      ),
    );
  }
}
