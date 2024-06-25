import 'package:MobileGKI/common/widget/c_fdetailpage.dart';
import 'package:MobileGKI/common/widget/d_imgview.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:MobileGKI/utils/theme/constrains/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/configVar.dart';

class FDetailPageBuilder extends StatelessWidget {
  FDetailPageBuilder({
    super.key,
    required this.content,
    this.person_name = "",
    this.person_status = "",
    this.person_pic = "",
    this.jam_detail = "",
    this.address = "",
    this.tanggal_detail = "",
    required this.content_pic,
    required this.title,
    this.category_name = "",
    required this.isheadMetadata,
    required this.isAddress,
    required this.isTime,
    required this.isTimeDay,
    required this.isCatHMD,
    required this.isAuthor,
    this.author = "",
  });

  final String content,
      author,
      person_name,
      person_status,
      person_pic,
      content_pic,
      title,
      jam_detail,
      tanggal_detail,
      address,
      category_name;
  final bool isheadMetadata, isAddress, isTime, isTimeDay, isCatHMD, isAuthor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FDetailImgView(
              children: Container(),
              imgUrl:
                  ConfigBack.apiAdress + ConfigBack.imgInternet + content_pic,
              netImg: true,
            ),
            FDetailPage(
              isCatHMD: isCatHMD,
              isTimeDay: isTimeDay,
              isTime: isTime,
              isHeadMetadata: isheadMetadata,
              deskripsi: content,
              Judul: title,
              Author: author,
              HMD_jenisAcara: category_name,
              HMD_personPic: person_pic,
              HMD_personName: person_name,
              HMD_status: person_status,
              DT_jam: jam_detail, // Example data
              DT_tanggal: tanggal_detail, // Example data
              isAddress: isAddress,
              Address: address, isAuthor: isAuthor,
            )
          ],
        ),
      ),
    );
  }
}
