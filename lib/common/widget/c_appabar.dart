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
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: FilemonSized.md),
        child: AppBar(
          automaticallyImplyLeading: false,
          leading: showBackArrow
              ? IconButton(
                  onPressed: () => Get.back(), icon: Icon(Icons.arrow_back))
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
