import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moneymentor/auth/authentication.dart';
import 'package:moneymentor/utils/constants/image_strings.dart';
import 'package:moneymentor/utils/helpers/network_manager.dart';
import 'package:moneymentor/utils/popups/full_screen_loader.dart';
import 'package:moneymentor/utils/popups/loader.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final hidepassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    final rememberMeEmail = localStorage.read('REMEMBER_ME_EMAIL');
    final rememberMePassword = localStorage.read('REMEMBER_ME_PASSWORD');

    // Check if rememberMeEmail is not null before assigning
    email.text = rememberMeEmail ?? '';

    // Check if rememberMePassword is not null before assigning
    password.text = rememberMePassword ?? '';

    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.docerAnimation);
      // Check the connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stoploading();
        return;
      }
      // Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stoploading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      final UserCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      TFullScreenLoader.stoploading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stoploading();
      TLoaders.showErrorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
