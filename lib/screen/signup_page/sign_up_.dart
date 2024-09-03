import 'package:flutter/material.dart';
import 'package:moneymentor/screen/login_page/common_widgets_login/divider_signup_.dart';
import 'package:moneymentor/screen/login_page/common_widgets_login/social_media_logo.dart';
import 'package:moneymentor/screen/signup_page/common_widget_signup/signup_form_widget.dart';
import 'package:moneymentor/utils/constants/sizes.dart';
import 'package:moneymentor/utils/constants/text_strings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              // Title
              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Form
              const SignUpForm(),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              const DivederForSignUp(),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              const SocialMediaLogo()
            ],
          ),
        ),
      ),
    );
  }
}
