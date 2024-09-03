import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moneymentor/utils/constants/sizes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.onLeadingTap,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? onLeadingTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                icon: const Icon(Iconsax.arrow_left),
                onPressed: () => Get.back(),
              )
            : leadingIcon != null
                ? IconButton(
                    icon: Icon(leadingIcon),
                    onPressed: onLeadingTap,
                  )
                : null,
        title: title,
        actions: actions,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
