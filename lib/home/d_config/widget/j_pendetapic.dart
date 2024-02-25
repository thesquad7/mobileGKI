import 'package:MobileGKI/utils/constrains/image_string.dart';
import 'package:flutter/material.dart';

class PendetaPic extends StatelessWidget {
  const PendetaPic({
    super.key,
    this.isNetworkImg = false,
    required this.imgurl,
  });
  final bool isNetworkImg;
  final String imgurl;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 52,
      left: 10,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: Offset(0, 3), // Shadow position
          ),
        ], borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: isNetworkImg ? Image.network(imgurl) : Image.asset(imgurl)),
      ),
    );
  }
}
