import 'package:MobileGKI/common/widget/c_fdetailpage.dart';
import 'package:MobileGKI/common/widget/d_imgview.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:MobileGKI/utils/theme/constrains/text.dart';
import 'package:flutter/material.dart';

class BerandaAcaraDetail extends StatelessWidget {
  const BerandaAcaraDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        FDetailImgView(
          children: Container(),
          imgUrl: Filemonimages.pendeta1,
          netImg: false,
        ),
        FDetailPage(
          isTimeDay: true,
          isTime: true,
          DT_jam: "11.11",
          DT_tanggal: "11 Maret 2023",
          isHeadMetadata: false,
          deskripsi: FilemonText.lorem100,
          Judul: "Lorem",
          isAddress: true,
          isAuthor: true,
          Author: FilemonText.firstName,
          Address: FilemonText.addressexp,
        )
      ]),
    );
  }
}
