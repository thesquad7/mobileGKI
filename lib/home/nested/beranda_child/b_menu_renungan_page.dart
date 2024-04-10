import 'package:MobileGKI/common/widget/c_fhorizontalcardImgbg.dart';
import 'package:MobileGKI/common/widget/c_fmanagementpage.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:flutter/material.dart';

class RenunganBeranda extends StatelessWidget {
  const RenunganBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return FManagementPageDesign(
        pageTitle: "Renungan",
        itemCount: 3,
        autokeepalive: false,
        searchbutton: false,
        child: (_, index) {
          return FHorizontalCardImgBG(imgUrl: Filemonimages.product3);
        });
  }
}
