import 'package:flutter/material.dart';

class ChangeLogPas extends StatelessWidget {
  const ChangeLogPas({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          child: const Text('Изменить пароль'),
          onTap: () {
            // Navigator.of(context).pushNamed('/finder/map');
          },
        ),
        const SizedBox(height: 15),
        InkWell(
          child: const Text('Изменить почту'),
          onTap: () {
            // Navigator.of(context).pushNamed('/finder/map');
          },
        )
      ],
    );
  }
}
