import 'package:MobileGKI/common/widget/c_appabar.dart';
import 'package:MobileGKI/home/d_config/widget/aa_circlephotos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class berandaAppbar extends StatelessWidget {
  const berandaAppbar(
      {super.key,
      this.textGrettings = "Greet",
      this.textUser = "User",
      this.Imgurl = "null",
      this.areImage = false,
      this.imgH = 10,
      this.imgW = 10,
      this.icon = const SizedBox(),
      this.are2line = false,
      this.title = "Title",
      this.areAction = false,
      this.exitbutton = const SizedBox()});
  final String textGrettings, textUser, Imgurl, title;
  final bool areImage, are2line, areAction;
  final Widget exitbutton;
  final Widget? icon;
  final double? imgH, imgW;

  @override
  Widget build(BuildContext context) {
    return FilemonAppBar(
        title: are2line
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(textGrettings,
                    style: Theme.of(context).textTheme.labelMedium),
                Text(textUser, style: Theme.of(context).textTheme.headlineSmall)
              ])
            : Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
        actions: areAction
            ? areImage
                ? [
                    CircleImg(
                      imgUrl: Imgurl,
                      heigth: imgH,
                      width: imgW,
                    )
                  ]
                : [icon!]
            : [exitbutton]);
  }
}
