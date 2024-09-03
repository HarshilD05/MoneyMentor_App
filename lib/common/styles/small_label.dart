import 'package:flutter/material.dart';

class SmallLabel extends StatelessWidget {
  final String text;

  const SmallLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 12.0), // Adjust font size as needed
    );
  }
}
