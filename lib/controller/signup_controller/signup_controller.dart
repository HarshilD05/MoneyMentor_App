import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymentor/auth/authentication.dart';
import 'package:moneymentor/auth/data/user_model.dart';
import 'package:moneymentor/auth/data/user_repo.dart';
import 'package:moneymentor/screen/verify_screen/verify_screen.dart';
import 'package:moneymentor/utils/constants/image_strings.dart';
import 'package:moneymentor/utils/helpers/network_manager.dart';
import 'package:moneymentor/utils/popups/full_screen_loader.dart';
import 'package:moneymentor/utils/popups/loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final hidepassword = true.obs;
  final privarcypolicy = true.obs;
  final email = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();
  get fullname => "${firstname.text} ${lastname.text}";

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.docerAnimation);
      // Check the connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stoploading();
        return;
      }
      // Validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stoploading();
        return;
      }

      //privarcy policy
      if (!privarcypolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept privarcy policy ',
            message:
                'In order to create account, you must have to read and accept the Privacy Policy & term and Condition ');
        return;
      }

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //Save and authentication
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstname: firstname.text.trim(),
          lastname: lastname.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNo.text.trim(),
          profilePicture: '');

      final userRepostory = Get.put(UserRepository());
      await userRepostory.saveUserRecord(newUser);

      TFullScreenLoader.stoploading();

      //show success message
      TLoaders.successSnackBar(
          title: 'Congratulation',
          message: 'Your account has been created! Verify email to Continue .');

      // Move verfiy Email
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stoploading();
      TLoaders.showErrorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
