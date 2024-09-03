import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:moneymentor/auth/authentication.dart';
import 'package:moneymentor/screen/success_screen/success_screen.dart';
import 'package:moneymentor/utils/constants/image_strings.dart';
import 'package:moneymentor/utils/constants/text_strings.dart';
import 'package:moneymentor/utils/popups/loader.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email sent ',
          message: 'Please check your inbox an verify your email .');
    } catch (e) {
      TLoaders.showErrorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => CustomSuccessScreen(
            imageAsset: TImages.staticSuccessIllustration,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () {
              AuthenticationRepository.instance.screenRedirect();
            }));
      }
    });
  }

  checkEmailVerificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;

    if(currentUser != null && currentUser.emailVerified){

      Get.off(() => CustomSuccessScreen(
            imageAsset: TImages.staticSuccessIllustration,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () {
              AuthenticationRepository.instance.screenRedirect();
            }));

    }
  }
}
