import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:moneymentor/utils/constants/colors.dart';
import 'package:moneymentor/utils/constants/sizes.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actiontext,
      this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actiontext;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width * 0.6),
          const SizedBox(height: TSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                      onPressed: onActionPressed,
                      style: OutlinedButton.styleFrom(
                          backgroundColor: TColors.dark),
                      child: Text(
                        actiontext!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: TColors.light),
                      )),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
