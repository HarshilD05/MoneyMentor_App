import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:moneymentor/utils/constants/colors.dart';
import 'package:moneymentor/utils/constants/text_strings.dart';
import 'package:moneymentor/utils/helpers/helper_functions.dart';

class DivederForSignUp extends StatelessWidget {
  const DivederForSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
                color: dark ? TColors.darkGrey : TColors.grey,
                thickness: 0.5,
                indent: 60,
                endIndent: 5)),
        Text(TTexts.orSignInWith.capitalize!,
            style: Theme.of(context).textTheme.labelMedium),
        Flexible(
            child: Divider(
                color: dark ? TColors.darkGrey : TColors.grey,
                thickness: 0.5,
                indent: 5,
                endIndent: 60)),
      ],
    );
  }
}
