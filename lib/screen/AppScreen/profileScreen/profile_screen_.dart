import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moneymentor/auth/authentication.dart';
import 'package:moneymentor/auth/data/user_model.dart';
import 'package:moneymentor/common/widget/appbar/appbar.dart';
import 'package:moneymentor/common/widget/primaryheader.dart';
import 'package:moneymentor/screen/AppScreen/profileScreen/edit_profile.screen.dart';
import 'package:moneymentor/utils/constants/colors.dart';
import 'package:moneymentor/utils/constants/image_strings.dart';
import 'package:moneymentor/utils/constants/sizes.dart';
import 'package:moneymentor/utils/helpers/helper_functions.dart';

class ProfileScreen extends StatefulWidget {
  final UserModel user;
  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var controller = Get.put(AuthenticationRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  CustomAppBar(
                    title: Text("Account",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: TColors.white)),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  //User Profile Card
                  UserProfileTile(
                    name : widget.user.username,
                    email : widget.user.email, 
                    onPressed: () => Get.to(() => const ProfileEdit())),
                  //Spacing
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const SectionHeading(
                    textcolor: Colors.black,
                    title: "Account Setting",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const SettingMenuTile(
                      icon: Iconsax.safe_home,
                      title: "Order History",
                      subtitle: "All Buy and Sell Orders"),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const SectionHeading(
                    textcolor: Colors.black,
                    title: "Activity",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const SettingMenuTile(
                      icon: Iconsax.safe_home,
                      title: "WishList",
                      subtitle: "Stock which are wish to buy"),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const SectionHeading(
                    textcolor: Colors.black,
                    title: "Support",
                    showActionButton: false,
                  ),
                  const SettingMenuTile(
                      icon: Iconsax.safe_home,
                      title: "Help and Support",
                      subtitle: ""),
                  const SettingMenuTile(
                      icon: Iconsax.safe_home,
                      title: "Fine Print",
                      subtitle: ""),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {
                          controller.logout();
                        },
                        child: const Text("Logout")),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SettingMenuTile extends StatelessWidget {
  const SettingMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.trailing});

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: TColors.primary,
      ),
      title: Text(title, style: Theme.of(context).textTheme.titleSmall),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.titleSmall),
      trailing: trailing,
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    this.textcolor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = "View All",
    this.onPressed,
  });

  final Color? textcolor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
              Theme.of(context).textTheme.labelMedium!.apply(color: dark ? TColors.white : textcolor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}

class UserProfileTile extends StatelessWidget {
  final String name;
  final String email;
  final VoidCallback onPressed;

  const UserProfileTile({
    super.key,
    required this.name,
    required this.email,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(SignUpController());
    return ListTile(
      leading: const CircularImageWidget(
        imageUrl: TImages.user,
        size: 50,
      ),
      title: Text(name,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white)),
      subtitle: Text(email,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .apply(color: TColors.white)),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.edit,
            color: Colors.white,
          )),
    );
  }
}

class CircularImageWidget extends StatelessWidget {
  final String imageUrl;
  final double size;

  const CircularImageWidget({
    super.key,
    required this.imageUrl,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2, // Divide by 2 to get the radius from diameter
      child: Image.asset(imageUrl),
    );
  }
}
