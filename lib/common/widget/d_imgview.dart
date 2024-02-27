import 'package:MobileGKI/common/widget/c_appabar.dart';
import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/utils/constrains/image_string.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';

class FDetailImgView extends StatelessWidget {
  const FDetailImgView({
    super.key,
    required this.children,
  });

  final Widget children;

  @override
  Widget build(BuildContext context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);
    return FilemonPrimaryHeaderCon(
        height: 300,
        child: Stack(children: [
          const SizedBox(
            height: 300,
            child: Padding(
                padding: const EdgeInsets.only(
                    top: FilemonSized.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(Filemonimages.pendeta1),
                  ),
                )),
          ),
          const FilemonAppBar(
            showBackArrow: true,
          ),
          children
        ]),
        color: Colors.purpleAccent);
  }
}
