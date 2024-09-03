import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymentor/controller/signup_controller/signup_controller.dart';
import 'package:moneymentor/utils/constants/colors.dart';
import 'package:moneymentor/utils/constants/sizes.dart';
import 'package:moneymentor/utils/constants/text_strings.dart';
import 'package:moneymentor/utils/helpers/helper_functions.dart';

class TermAndCondition extends StatelessWidget {
  const TermAndCondition({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    final bool dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            height: 28,
            width: 28,
            child: Obx(() => Checkbox(value: controller.privarcypolicy.value, onChanged: (value) => controller.privarcypolicy.value = !controller.privarcypolicy.value ))),
        const SizedBox(width: TSizes.spaceBtwItems),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '${TTexts.iAgreeTo} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: TTexts.privacyPolicy,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? TColors.white : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? TColors.white : TColors.primary,
                      ),
                ),
                TextSpan(
                    text: '  ${TTexts.and} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: TTexts.termsOfUse,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? TColors.white : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? TColors.white : TColors.primary,
                      ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
