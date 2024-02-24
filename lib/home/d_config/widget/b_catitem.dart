import 'package:MobileGKI/utils/constrains/colors.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';

class CatHome extends StatelessWidget {
  const CatHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  Container(
                    width: 56,
                    height: 56,
                    padding: const EdgeInsets.all(FilemonSized.sm),
                    decoration: BoxDecoration(
                      color: FilemonColor.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(child: Image.asset("assets/logo.png")),
                  ),
                  const SizedBox(height: FilemonSized.spaceBtwItems / 2),
                  SizedBox(
                      width: 55,
                      child: Text(
                        'Category',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .apply(color: FilemonColor.white),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
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
