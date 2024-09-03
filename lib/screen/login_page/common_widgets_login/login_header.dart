import 'package:flutter/material.dart';
import 'package:moneymentor/utils/constants/image_strings.dart';
import 'package:moneymentor/utils/constants/sizes.dart';
import 'package:moneymentor/utils/constants/text_strings.dart';
import 'package:moneymentor/utils/helpers/helper_functions.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? TImages.darkAppLogo : TImages.lightAppLogo),
        ),
        Text(TTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: TSizes.xs),
        Text(TTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium)
      ],
    );
  }
}
