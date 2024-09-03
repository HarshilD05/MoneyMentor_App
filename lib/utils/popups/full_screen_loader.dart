import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymentor/common/widget/animation_widget.dart';
import 'package:moneymentor/utils/constants/colors.dart';
import 'package:moneymentor/utils/helpers/helper_functions.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 200),
              TAnimationLoaderWidget(text: text, animation: animation)
            ],
          ),
        ),
      ),
    );
  }

  static stoploading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
