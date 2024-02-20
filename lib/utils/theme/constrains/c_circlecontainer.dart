import 'package:MobileGKI/utils/theme/constrains/colors.dart';
import 'package:flutter/material.dart';

class FilemonTopContainer extends StatelessWidget {
  const FilemonTopContainer(
      {super.key,
      this.child,
      this.backgroundColor = FilemonColor.white,
      this.width = 400,
      this.heigth = 250,
      this.radius = 400,
      this.padding = 0});
  final double? width;
  final double? heigth;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: backgroundColor),
      child: child,
    );
  }
}
