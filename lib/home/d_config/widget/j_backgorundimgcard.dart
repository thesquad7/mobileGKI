import 'package:flutter/material.dart';

class BackgoundImgCard extends StatelessWidget {
  const BackgoundImgCard({
    super.key,
    required this.isNetworkImage,
    this.imageUrl = "null",
    this.fit = BoxFit.fitWidth,
  });
  final bool isNetworkImage;
  final String imageUrl;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 82,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Image(
              fit: fit,
              image: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider),
        ));
  }
}
