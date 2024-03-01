import 'package:MobileGKI/common/widget/c_fhorizontalcardImgbg.dart';
import 'package:MobileGKI/common/widget/c_fmanagementpage.dart';
import 'package:MobileGKI/utils/constrains/image_string.dart';
import 'package:flutter/material.dart';

class KesaksianBeranda extends StatelessWidget {
  const KesaksianBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return FManagementPageDesign(
        child: FHorizontalCardImgBG(
          imgUrl: Filemonimages.pendeta2,
        ),
        pageTitle: "Kesaksian",
        itemCount: 6,
        search: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        autokeepalive: false,
        searchbutton: true);
  }
}
