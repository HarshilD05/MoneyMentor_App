import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moneymentor/common/widget/on_boarding_common_.dart';
import 'package:moneymentor/controller/controller_on_boarding.dart';
import 'package:moneymentor/utils/constants/colors.dart';
import 'package:moneymentor/utils/constants/image_strings.dart';
import 'package:moneymentor/utils/constants/sizes.dart';
import 'package:moneymentor/utils/constants/text_strings.dart';
import 'package:moneymentor/utils/device/device_utility.dart';
import 'package:moneymentor/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          const SizedBox(
            height: TSizes.lg / 2,
          ),
          //Horizonatal Scrollable Page
          PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: const [
                OnBoardingCommonWidget(
                    imagestring: TImages.onBoardingImage1,
                    subtitle: TTexts.onBoardingSubTitle1,
                    title: TTexts.onBoardingTitle1),
                OnBoardingCommonWidget(
                    imagestring: TImages.onBoardingImage2,
                    subtitle: TTexts.onBoardingSubTitle2,
                    title: TTexts.onBoardingTitle2),
                OnBoardingCommonWidget(
                    imagestring: TImages.onBoardingImage3,
                    subtitle: TTexts.onBoardingSubTitle3,
                    title: TTexts.onBoardingTitle3)
              ]),
          //Skip Button
          Positioned(
              top: TDeviceUtils.getAppBarHeight(),
              right: TSizes.defaultSpace,
              child: TextButton(
                  onPressed: () {
                    controller.skipPage();
                  },
                  child: const Text('Skip'))),
          //Dot Navigation SmoothPageIndication
          const NavigationDot(),
          //Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}

class NavigationDot extends StatelessWidget {
  const NavigationDot({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: TSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: dark ? TColors.light : TColors.dark,
              dotHeight: 6),
        ));
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () {
          // Navigate to the next onboarding screen
          OnBoardingController.instance.nextPage();
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? TColors.primary : Colors.black,
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
