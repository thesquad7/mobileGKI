import 'package:MobileGKI/common/widget/c_fdetailpage.dart';
import 'package:MobileGKI/common/widget/d_imgview.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:MobileGKI/utils/theme/constrains/text.dart';
import 'package:flutter/material.dart';

class BerandaProductPageDetail extends StatelessWidget {
  const BerandaProductPageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          FDetailImgView(
            children: Container(),
            imgUrl: Filemonimages.product1,
            netImg: false,
          ),
          FDetailPage(
            isTime: false,
            isHeadMetadata: false,
            deskripsi: FilemonText.lorem100,
            Judul: FilemonText.onBoardingSubTitle1,
            isAddress: false,
          )
        ]),
      ),
    );
  }
}
