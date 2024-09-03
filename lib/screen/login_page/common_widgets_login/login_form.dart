import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moneymentor/controller/login_controller/login_controller.dart';
import 'package:moneymentor/screen/forget_screen/forget_screen_pages/forget_screen.dart';
import 'package:moneymentor/screen/signup_page/sign_up_.dart';
import 'package:moneymentor/utils/constants/sizes.dart';
import 'package:moneymentor/utils/constants/text_strings.dart';
import 'package:moneymentor/utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.lg),
        child: Column(
          children: [
            //Email
            TextFormField(
              controller: controller.email,
              validator: (value)=>TValidator.validateEmail(value),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email),
            ),
            //Spacing
            const SizedBox(height: TSizes.spaceBtwInputFields),
            //Password
            Obx(
            () => TextFormField(
              validator: (value) => TValidator.validatePassword(value),
              obscureText: controller.hidepassword.value,
              controller: controller.password,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: TTexts.password,
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidepassword.value =
                          !controller.hidepassword.value,
                      icon: Icon(controller.hidepassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye))),
            ),
          ),

            const SizedBox(height: TSizes.spaceBtwInputFields / 3),

            //Remeber Me & Forget Password

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remember Me
                Row(
                  children: [
                    Obx(()=>Checkbox(value: controller.rememberMe.value, onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value)),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                //Forget Password
                TextButton(
                    onPressed: () {
                      Get.to(() => const ForgetScreen());
                    },
                    child: const Text(TTexts.forgetPassword))
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            //Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(TTexts.signIn),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            //Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUpScreen()),
                child: const Text(TTexts.createAccount),
              ),
            ),
            const SizedBox(height: TSizes.xs),
          ],
        ),
      ),
    );
  }
}
