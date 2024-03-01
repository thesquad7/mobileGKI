import 'package:MobileGKI/utils/constrains/colors.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:MobileGKI/utils/theme/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilemonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FilemonAppBar(
      {super.key,
      this.title,
      this.actions,
      this.leadingIcon,
      this.leeadingOnPressed,
      this.showBackArrow = false});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leeadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: FilemonSized.sm),
        child: AppBar(
          automaticallyImplyLeading: false,
          leading: showBackArrow
              ? Container(
                  decoration: BoxDecoration(
                      color: dark
                          ? FilemonColor.white.withOpacity(0.3)
                          : FilemonColor.dark.withOpacity(0.7),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back,
                        color: dark ? Colors.black : Colors.white,
                      )),
                )
              : leadingIcon != null
                  ? IconButton(
                      onPressed: leeadingOnPressed, icon: Icon(leadingIcon))
                  : null,
          title: title,
          actions: actions,
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromWidth(FilemonDeviceUtils.getAppBarHeight());
}
