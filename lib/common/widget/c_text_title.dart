import 'package:flutter/material.dart';

class FProductTextTitle extends StatelessWidget {
  const FProductTextTitle({
    super.key,
    this.title = "Product Name of GKI Indramayu",
    this.smallSize = false,
    this.maxLine = 2,
    this.textAlign,
  });
  final String title;
  final bool smallSize;
  final int maxLine;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.titleLarge
          : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: TextAlign.left,
    );
  }
}
