import 'package:flutter/material.dart';
import 'package:moneymentor/utils/constants/sizes.dart';
import 'package:moneymentor/utils/helpers/helper_functions.dart';

class OnBoardingCommonWidget extends StatelessWidget {
  const OnBoardingCommonWidget(
      {super.key,
      required this.imagestring,
      required this.subtitle,
      required this.title});

  final String imagestring, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const SizedBox(height: TSizes.lg),
              Image(
                  width: THelperFunctions.screenWidth() * 0.8,
                  height: THelperFunctions.screenWidth() * 0.8,
                  image: AssetImage(imagestring)),
              Text(title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(subtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
            ],
          ),
        )
      ],
    );
  }
}
