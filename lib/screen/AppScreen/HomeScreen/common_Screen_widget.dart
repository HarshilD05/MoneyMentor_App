import 'package:flutter/material.dart';
import 'package:moneymentor/utils/constants/colors.dart';
import 'package:moneymentor/utils/helpers/helper_functions.dart';

class CustomIconButton extends StatelessWidget {
  // final Function onTap; // Function to be called when tapped
  final IconData iconData; // The icon to display
  final String text; // The text to display below the icon

  const CustomIconButton({
    super.key,
    // required this.onTap,
    required this.iconData,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color:
              dark ? Colors.black :
             Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: const Color.fromARGB(106, 0, 0, 0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 2.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          height: 48,
          width: 48,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(iconData),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 12, color: TColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}
