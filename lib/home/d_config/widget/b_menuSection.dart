import 'package:MobileGKI/home/d_config/widget/b_catitem.dart';
import 'package:MobileGKI/home/d_config/widget/b_headcat.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';

class menuSecHome extends StatelessWidget {
  const menuSecHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: FilemonSized.defaultSpace),
          child: FilemonCatHeading(
            title: "Menu",
            showActionButton: false,
          ),
        ),
        SizedBox(height: FilemonSized.spaceBtwItems),
        CatHome()
      ]),
    );
  }
}
