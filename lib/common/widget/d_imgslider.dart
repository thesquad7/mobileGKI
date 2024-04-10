import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/utils/constrains/colors.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';

class FCostumImgSlider extends StatelessWidget {
  const FCostumImgSlider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 0,
        bottom: 15,
        left: 0,
        child: SizedBox(
          height: 80,
          child: ListView.separated(
              itemCount: 6,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, __) => const SizedBox(
                    width: FilemonSized.spaceBtwItems,
                  ),
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (_, index) => RoundedIMG(
                    width: 60,
                    border: Border.all(color: FilemonColor.primary),
                    backgroundColor:
                        dark ? FilemonColor.dark : FilemonColor.white,
                    padding: const EdgeInsets.all(FilemonSized.sm),
                    imageUrl: Filemonimages.pendeta1,
                  )),
        ));
  }
}
