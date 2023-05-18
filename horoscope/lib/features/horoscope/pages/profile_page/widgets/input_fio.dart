import 'package:flutter/material.dart';

class InputFio extends StatelessWidget {
  const InputFio({super.key, this.nameController, this.surnameController});
  final nameController;
  final surnameController;

  Widget customInput(
      BuildContext context, String hintName, TextEditingController controller) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.black, fontSize: 22),
        decoration: InputDecoration(
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
          customInput(context, 'Имя', nameController),
          const SizedBox(
            height: 20,
          ),
          customInput(context, 'Фамилия', surnameController),
        ],
      ),
    );
  }
}
