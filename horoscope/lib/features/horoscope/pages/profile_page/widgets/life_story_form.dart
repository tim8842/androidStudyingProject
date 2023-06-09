// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class LifeStoryForm extends StatelessWidget {
  const LifeStoryForm({super.key, this.controller});
  final controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black, fontSize: 22),
      restorationId: 'life_story_field',
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        helperText: "Напишите коротко про себя.",
        labelText: "О себе:",
      ),
      maxLines: 3,
    );
  }
}
