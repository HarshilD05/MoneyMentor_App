import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moneymentor/utils/constants/colors.dart';

class TLoaders {
  static successSnackBar(
      {required String title, required String message, int duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: TColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check, color: TColors.white),
    );
  }

  static void showErrorSnackbar({
    required String title,
    String message = '',
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      backgroundColor: Colors.red.shade600,
      colorText: TColors.white, // Assuming TColors is defined
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(
        Iconsax.warning_2, // Assuming Iconsax is imported
        color: TColors.white,
      ),
    );
  }

  static void warningSnackBar({
    required String title,
    String message = '',
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.white, // Assuming TColors is defined elsewhere
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(
        Iconsax.warning_2, // Assuming Iconsax is imported correctly
        color: TColors.white,
      ),
    );
  }
}
