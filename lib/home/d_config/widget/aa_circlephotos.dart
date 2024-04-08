import 'package:MobileGKI/utils/constrains/colors.dart';
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
      decoration: BoxDecoration(
        color: FilemonColor.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child:
            CircleAvatar(radius: heigth, backgroundImage: NetworkImage(imgUrl)),
      ),
    );
  }
}
