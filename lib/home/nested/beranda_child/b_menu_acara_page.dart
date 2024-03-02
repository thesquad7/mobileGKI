import 'package:MobileGKI/common/widget/c_fhorizontalcardImgbg.dart';
import 'package:MobileGKI/common/widget/c_fmanagementpage.dart';
import 'package:MobileGKI/utils/constrains/image_string.dart';
import 'package:flutter/material.dart';

class MenuAcaraBeranda extends StatelessWidget {
  const MenuAcaraBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return FManagementPageDesign(
      child: (_, index) {
        return FHorizontalCardImgBG(
          imgUrl: Filemonimages.pendeta2,
        );
      },
      pageTitle: "Acara",
      searchbutton: false,
      itemCount: 7,
      autokeepalive: false,
    );
  }
}
