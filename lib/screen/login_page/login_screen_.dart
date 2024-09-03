import 'package:flutter/material.dart';
import 'package:moneymentor/common/styles/spaceing_style_.dart';
import 'package:moneymentor/screen/login_page/common_widgets_login/divider_signup_.dart';
import 'package:moneymentor/screen/login_page/common_widgets_login/login_form.dart';
import 'package:moneymentor/screen/login_page/common_widgets_login/login_header.dart';
import 'package:moneymentor/screen/login_page/common_widgets_login/social_media_logo.dart';
import 'package:moneymentor/utils/constants/sizes.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //Logo , Title & Sub - Title
              LoginHeader(),
              //Form
              LoginForm(),
              //Divider
              DivederForSignUp(),
              //Space
              SizedBox(height: TSizes.spaceBtwItems),
              //Social Media Footer
              SocialMediaLogo(),
            ],
          ),
        ),
      ),
    );
  }
}
