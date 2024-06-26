import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/common/widget/c_rounded_container.dart';
import 'package:MobileGKI/common/widget/c_text_title.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/constrains/colors.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:MobileGKI/utils/theme/costum_theme/shadow.dart';
import 'package:flutter/material.dart';

class FverticalCard extends StatelessWidget {
  const FverticalCard({
    super.key,
    required this.ImgUrl,
    required this.title,
    required this.tag,
  });
  final String ImgUrl, title, tag;

  @override
  Widget build(BuildContext context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);
    return Container(
      width: 180,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          boxShadow: [FilemonShadowStyle.verticalCard],
          borderRadius: BorderRadius.circular(FilemonSized.productImageRadius),
          color: dark ? FilemonColor.darkGrey : FilemonColor.white),
      child: Column(children: [
        RoundedContainer(
          height: 170,
          backgroundColor: dark ? FilemonColor.dark : FilemonColor.light,
          child: Stack(
            children: [
              RoundedIMG(
                isNetworkImage: true,
                padding: EdgeInsets.all(0),
                imageUrl:
                    ConfigBack.apiAdress + ConfigBack.imgInternet + ImgUrl,
                height: 170,
                width: 170,
                applyImgRadius: true,
                fit: BoxFit.fitHeight,
              ),
              Positioned(
                top: 10,
                left: 10,
                child: RoundedContainer(
                  child: Text(tag),
                  radius: FilemonSized.sm,
                  backgroundColor: FilemonColor.secondary.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: FilemonSized.sm, vertical: FilemonSized.xs),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: FilemonSized.sm),
          child: Column(children: [
            FProductTextTitle(
              title: title,
              smallSize: true,
            )
          ]),
        )
      ]),
    );
  }
}
