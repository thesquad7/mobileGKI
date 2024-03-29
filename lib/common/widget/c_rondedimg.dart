import 'package:MobileGKI/utils/constrains/colors.dart';
import 'package:MobileGKI/utils/constrains/image_string.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';

class RoundedIMG extends StatelessWidget {
  const RoundedIMG({
    super.key,
    this.width,
    this.height,
    this.imageUrl = Filemonimages.product1,
    this.applyImgRadius = true,
    this.border,
    this.backgroundColor = FilemonColor.light,
    this.fit = BoxFit.contain,
    this.padding = const EdgeInsets.all(0),
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = FilemonSized.md,
  });
  final double? width, height;
  final String imageUrl;
  final bool applyImgRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: padding,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              border: border,
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius)),
          child: ClipRRect(
            borderRadius: applyImgRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: Image(
                fit: fit,
                image: isNetworkImage
                    ? NetworkImage(imageUrl)
                    : AssetImage(imageUrl) as ImageProvider),
          ),
        ),
      ),
    );
  }
}
