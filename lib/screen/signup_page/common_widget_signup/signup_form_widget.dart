import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moneymentor/controller/signup_controller/signup_controller.dart';
import 'package:moneymentor/screen/signup_page/common_widget_signup/term_and_condition.dart';

import 'package:moneymentor/utils/constants/sizes.dart';
import 'package:moneymentor/utils/constants/text_strings.dart';
import 'package:moneymentor/utils/validators/validation.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TValidator.validateEmptyText("First Name", value),
                  controller: controller.firstname,
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastname,
                  validator: (value) =>
                      TValidator.validateEmptyText("Last Name", value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                TValidator.validateEmptyText("Username", value),
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                prefixIcon: Icon(Iconsax.user_edit),
                labelText: TTexts.username),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            validator: (value) => TValidator.validateEmail(value),
            controller: controller.email,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email),
          ),
          //Spacing
          const SizedBox(height: TSizes.spaceBtwInputFields),
          // Phone Number
          TextFormField(
            validator: (value) => TValidator.validatePhoneNumber(value),
            controller: controller.phoneNo,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              prefixIcon: Icon(Iconsax.call),
              labelText: TTexts.phoneNo,
            ),
          ),
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
          const SizedBox(height: TSizes.spaceBtwInputFields),
          // Term and Condition Check Box
          const TermAndCondition(),
          const SizedBox(height: TSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                controller.signup();
              },
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
