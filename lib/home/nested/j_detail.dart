import 'package:MobileGKI/common/widget/c_fdetailpage.dart';
import 'package:MobileGKI/common/widget/d_imgview.dart';
import 'package:MobileGKI/utils/constrains/image_string.dart';
import 'package:MobileGKI/utils/theme/constrains/text.dart';
import 'package:flutter/material.dart';

class FDetailJadwal extends StatelessWidget {
  const FDetailJadwal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          FDetailImgView(
            children: Container(),
            imgUrl: Filemonimages.slide1,
          ),
          FDetailPage(
            isTime: true,
            isHeadMetadata: false,
            deskripsi: FilemonText.lorem100,
            Judul: FilemonText.loginSubTitle,
            HMD_jenisAcara: "Ibadah Umum",
            HMD_personName: "PDT.FR Sitanggang",
            HMD_status: "Pendeta Senior",
            DT_jam: "11.00",
            DT_tanggal: "Selasa, 12 Maret",
            isAddress: false,
            Address: FilemonText.addressexp,
          )
        ]),
      ),
    );
  }
}
