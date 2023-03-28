import 'package:flutter/material.dart';

class AHref extends StatelessWidget {
  final String text;
  final Color color;
  final Function()? onTap;

  const AHref(
      {super.key,
      required this.text,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(text, style: TextStyle(color: color)),
    );
  }
}
