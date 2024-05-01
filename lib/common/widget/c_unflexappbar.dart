import 'package:MobileGKI/utils/constrains/colors.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FilemonStableAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  FilemonStableAppBar(
      {super.key,
      this.searchbutton = false,
      required this.pageTitle,
      this.search});

  final bool searchbutton;
  final String pageTitle;
  final IconButton? search;
  @override
  Widget build(BuildContext context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);
    return AppBar(
      leading: Center(
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: dark
                  ? FilemonColor.white.withOpacity(0.3)
                  : FilemonColor.dark.withOpacity(0.7),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                size: 20,
                color: dark ? Colors.black : Colors.white,
              )),
        ),
      ),
      title: Text(pageTitle),
      actions: searchbutton ? [search!] : null,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromWidth(FilemonDeviceUtils.getAppBarHeight());
}
