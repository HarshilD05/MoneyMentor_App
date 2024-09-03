import 'package:flutter/material.dart';
import 'package:moneymentor/screen/forget_screen/common_widget_forget/onclickbutton.dart';
import 'package:moneymentor/screen/forget_screen/common_widget_forget/otpform.dart';

class OtpVerfication extends StatefulWidget {
  const OtpVerfication({super.key});

  @override
  State<OtpVerfication> createState() => _OtpVerficationState();
}

class _OtpVerficationState extends State<OtpVerfication> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
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
                    "OTP Verfication",
                    style: TextStyle(
                      fontSize: 31,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                    "Enter the Verfication code we just sent an your email address."),
                const SizedBox(height: 20),
                const OTPForm(),
                const SizedBox(height: 30),
                OnCLickButton(
                  buttoncolor: Colors.black,
                  textcolor: Colors.white,
                  buttontitle: "Verify",
                  onTap: () {
                    // Get.to(const CraeteNewPassword());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
