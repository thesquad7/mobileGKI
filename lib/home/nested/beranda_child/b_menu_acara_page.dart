import 'package:MobileGKI/common/widget/c_fhorizontalcardImgbg.dart';
import 'package:MobileGKI/common/widget/c_fmanagementpage.dart';
import 'package:MobileGKI/home/nested/beranda_child/beranda_menu_detail/bd_acara_page.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuAcaraBeranda extends StatelessWidget {
  const MenuAcaraBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return FManagementPageDesign(
      child: (_, index) {
        return InkWell(
          onTap: () {
            Get.to(() => const BerandaAcaraDetail());
          },
          child: FHorizontalCardImgBG(
            imgUrl: Filemonimages.pendeta2,
          ),
        );
      },
      pageTitle: "Acara",
      searchbutton: false,
      itemCount: 4,
      autokeepalive: false,
    );
  }
}
