import 'package:flutter/material.dart';

class OnCLickButton extends StatelessWidget {
  const OnCLickButton({
    super.key,
    required this.buttoncolor,
    required this.textcolor,
    required this.buttontitle,
    required this.onTap,
  }) : width = 350; // Define a fixed width

  final Color buttoncolor;
  final Color textcolor;
  final String buttontitle;
  final double width;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Use defined width
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          foregroundColor: textcolor,
          backgroundColor: buttoncolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(
          buttontitle,
          style: const TextStyle(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
