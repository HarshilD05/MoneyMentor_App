import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moneymentor/utils/constants/colors.dart';
import 'package:moneymentor/utils/constants/text_strings.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  TextEditingController forEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {},
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                    fontSize: 31,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                  "Don't worry! It occurs. Please enter email address linked with your account."),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    prefixIcon: Icon(Iconsax.direct_normal),
                    labelText: TTexts.enterEmail),
              ),
              //
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(TTexts.sendCode),
                ),
              ),
              const Spacer(),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Remember Password?",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Login Now",
                        style: TextStyle(
                          color: TColors.buttonPrimary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
