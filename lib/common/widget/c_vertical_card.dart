import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/common/widget/c_rounded_container.dart';
import 'package:MobileGKI/common/widget/c_text_title.dart';
import 'package:MobileGKI/utils/constrains/image_string.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/constrains/colors.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:MobileGKI/utils/theme/costum_theme/shadow.dart';
import 'package:flutter/material.dart';

class FverticalCard extends StatelessWidget {
  const FverticalCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);
    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          boxShadow: [FilemonShadowStyle.verticalCard],
          borderRadius: BorderRadius.circular(FilemonSized.productImageRadius),
          color: dark ? FilemonColor.darkGrey : FilemonColor.white),
      child: Column(children: [
        RoundedContainer(
          height: 180,
          backgroundColor: dark ? FilemonColor.dark : FilemonColor.light,
          child: Stack(
            children: [
              const RoundedIMG(
                  imageUrl: Filemonimages.product1, applyImgRadius: true),
              Positioned(
                top: 12,
                child: RoundedContainer(
                  child: Text("Tag"),
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
              smallSize: true,
            )
          ]),
        )
      ]),
    );
  }
}
