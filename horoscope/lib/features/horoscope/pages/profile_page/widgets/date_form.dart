// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BasicDateField extends StatelessWidget {
  final format = DateFormat("dd-MM-yyyy");
  final Color colorTitle;
  final controller;

  BasicDateField({super.key, required this.colorTitle, this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Дата рождения',
            style: TextStyle(
                color: colorTitle, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          DateTimeField(
            controller: controller,
            style: TextStyle(color: colorTitle, fontSize: 20),
            format: format,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorTitle))),
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  locale: const Locale('ru'),
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
            },
          ),
        ]);
  }
}
