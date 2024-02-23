import 'package:MobileGKI/utils/theme/constrains/colors.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';

class CircleImg extends StatelessWidget {
  const CircleImg({
    super.key,
    this.width,
    this.heigth,
    required this.imgUrl,
  });
  final double? width, heigth;
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      padding: const EdgeInsets.all(FilemonSized.sm),
      decoration: BoxDecoration(
        color: FilemonColor.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(child: Image.asset(imgUrl)),
    );
  }
}
