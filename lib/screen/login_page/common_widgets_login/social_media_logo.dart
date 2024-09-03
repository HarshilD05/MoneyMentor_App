import 'package:flutter/material.dart';
import 'package:moneymentor/auth/authentication.dart';
import 'package:moneymentor/utils/constants/colors.dart';
import 'package:moneymentor/utils/constants/image_strings.dart';
import 'package:moneymentor/utils/constants/sizes.dart';
import 'package:moneymentor/utils/helpers/helper_functions.dart';

class SocialMediaLogo extends StatelessWidget {
  const SocialMediaLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () =>
                  AuthenticationRepository.instance.signInWithGoogle(context),
              icon: const Image(
                  width: TSizes.iconMd,
                  height: TSizes.iconMd,
                  image: AssetImage(TImages.google))),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: TSizes.iconMd,
                  height: TSizes.iconMd,
                  image: AssetImage(TImages.facebook))),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: Image(
                  width: TSizes.iconMd,
                  height: TSizes.iconMd,
                  image: AssetImage(
                      dark ? TImages.appleWhiteLogo : TImages.apple))),
        ),
      ],
    );
  }
}
