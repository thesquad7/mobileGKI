import 'package:MobileGKI/utils/constrains/colors.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FManagementPageDesign extends StatelessWidget {
  const FManagementPageDesign({
    super.key,
    required this.pageTitle,
    this.floatAButton = false,
    required this.itemCount,
    required this.autokeepalive,
    this.search,
    required this.searchbutton,
    required this.child,
    this.onPressed,
  });
  final int itemCount;
  final String pageTitle;
  final IconButton? search;
  final bool floatAButton, autokeepalive, searchbutton;
  final NullableIndexedWidgetBuilder child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
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
      ),
      floatingActionButton: floatAButton
          ? FloatingActionButton.small(
              child: const Icon(Icons.add), onPressed: onPressed)
          : null,
      body: Center(
        child: ListView.builder(
            addAutomaticKeepAlives: autokeepalive,
            itemCount: itemCount,
            itemBuilder: child),
      ),
    );
  }
}
