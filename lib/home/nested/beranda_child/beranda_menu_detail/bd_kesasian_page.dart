import 'package:MobileGKI/common/widget/c_fdetailpage.dart';
import 'package:MobileGKI/common/widget/d_imgview.dart';
import 'package:MobileGKI/utils/constrains/b_string_menu_data.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class DetailKesaksianBeranda extends StatelessWidget {
  const DetailKesaksianBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    final index = GetStorage();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          FDetailImgView(
            children: Container(),
            imgUrl: FBerandaTextData.kesaksianImgBG[index.read('index')],
            netImg: false,
          ),
          FDetailPage(
            isTimeDay: false,
            isTime: true,
            DT_tanggal: FBerandaTextData.kesaksianTanggal[index.read('index')],
            isHeadMetadata: true,
            HMD_personPic:
                FBerandaTextData.kesaksianImgPerson[index.read('index')],
            HMD_jenisAcara: FBerandaTextData.kesaksianSub[index.read('index')],
            HMD_personName:
                FBerandaTextData.kesaksianAuthor[index.read('index')],
            HMD_status: FBerandaTextData.kesaksianSub[index.read('index')],
            deskripsi: FBerandaTextData.kesaksianDeskirpsi[index.read('index')],
            Judul: FBerandaTextData.kesaksianTitle[index.read('index')],
            isAddress: true,
            Address: FBerandaTextData.kesaksianAlamat[index.read('index')],
          )
        ]),
      ),
    );
  }
}
