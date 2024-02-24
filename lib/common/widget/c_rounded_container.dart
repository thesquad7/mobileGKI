import 'package:MobileGKI/utils/constrains/colors.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.child,
      this.radius = FilemonSized.cardRadiusLg,
      this.showBorder = false,
      this.backgroundColor = FilemonColor.borderPrimary,
      this.borderColor = FilemonColor.white,
      this.padding,
      this.margin});
  final double? width, height;
  final Widget? child;
  final double radius;
  final bool showBorder;
  final Color backgroundColor, borderColor;
  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
