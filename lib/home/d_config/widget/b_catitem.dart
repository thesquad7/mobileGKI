import 'package:MobileGKI/utils/constrains/b_menubutton_config.dart';
import 'package:MobileGKI/utils/constrains/colors.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatHome extends StatelessWidget {
  const CatHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.only(left: FilemonSized.defaultSpace / 3),
      child: SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(right: FilemonSized.spaceBtwItems),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Get.to(() => berandaMenuConfig.screen[index]),
                    child: Container(
                      width: 56,
                      height: 56,
                      padding: const EdgeInsets.all(FilemonSized.sm),
                      decoration: BoxDecoration(
                        color:
                            dark ? FilemonColor.darkGrey : FilemonColor.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Icon(
                        berandaMenuConfig.iconMenu[index],
                        size: 40,
                      )),
                    ),
                  ),
                  const SizedBox(height: FilemonSized.spaceBtwItems / 2),
                  SizedBox(
                      width: 55,
                      child: Center(
                        child: Text(
                          berandaMenuConfig.judulMenu[index],
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(color: FilemonColor.white),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
