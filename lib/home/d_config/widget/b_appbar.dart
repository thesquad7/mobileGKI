import 'package:MobileGKI/common/widget/c_appabar.dart';
import 'package:MobileGKI/home/d_config/widget/aa_circlephotos.dart';
import 'package:flutter/material.dart';

class berandaAppbar extends StatelessWidget {
  const berandaAppbar({
    super.key,
    required this.textGrettings,
    required this.textUser,
    required this.Imgurl,
    required this.areImage,
    this.imgH = 10,
    this.imgW = 10,
    this.icon = const Icon(Icons.abc),
  });
  final String textGrettings, textUser, Imgurl;
  final bool areImage;
  final Icon icon;
  final double? imgH, imgW;

  @override
  Widget build(BuildContext context) {
    return FilemonAppBar(
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(textGrettings, style: Theme.of(context).textTheme.labelMedium),
        Text(textUser, style: Theme.of(context).textTheme.headlineSmall)
      ]),
      actions: areImage
          ? [
              CircleImg(
                imgUrl: Imgurl,
                heigth: imgH,
                width: imgW,
              )
            ]
          : [IconButton(onPressed: () {}, icon: icon)],
    );
  }
}
