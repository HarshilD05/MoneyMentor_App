import 'package:flutter/material.dart';

class TextFeildKar extends StatelessWidget {
  const TextFeildKar(
      {super.key,
      required this.hintText,
      required this.passstar,
      required this.controller});

  final String hintText;
  final bool passstar;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: passstar,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          hintText: hintText),
    );
  }
}
