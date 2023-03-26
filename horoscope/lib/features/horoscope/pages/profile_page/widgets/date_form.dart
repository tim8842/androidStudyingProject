import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BasicDateField extends StatelessWidget {
  final format = DateFormat("dd-MM-yyyy");

  BasicDateField({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Дата рождения', style: Theme.of(context).textTheme.titleSmall),
          DateTimeField(
            style: const TextStyle(color: Colors.black, fontSize: 20),
            format: format,
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
