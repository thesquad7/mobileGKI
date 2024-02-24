import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/utils/controller/controller_home.dart';
import 'package:MobileGKI/utils/theme/constrains/c_circlecontainer.dart';
import 'package:MobileGKI/utils/constrains/colors.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class FilemonHomeSlider extends StatelessWidget {
  const FilemonHomeSlider({
    super.key,
    required this.banners,
    required this.autoplay,
  });
  final List<String> banners;
  final bool autoplay;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: autoplay,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index),
              viewportFraction: 1),
          items: banners.map((url) => RoundedIMG(imageUrl: url)).toList(),
        ),
        const SizedBox(height: FilemonSized.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  FilemonTopContainer(
                    width: 20,
                    heigth: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? FilemonColor.primary
                        : FilemonColor.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
