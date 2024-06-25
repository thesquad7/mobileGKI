import 'package:MobileGKI/common/widget/c_addressdetail.dart';
import 'package:MobileGKI/common/widget/c_authour.dart';
import 'package:MobileGKI/common/widget/c_jadwal_date_time.dart';
import 'package:MobileGKI/common/widget/c_jadwal_judul.dart';
import 'package:MobileGKI/common/widget/c_jadwal_metadata.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FDetailPage extends StatelessWidget {
  const FDetailPage({
    super.key,
    required this.isTime,
    required this.isTimeDay,
    required this.isHeadMetadata,
    this.HMD_personName = "",
    this.HMD_status = "",
    this.HMD_jenisAcara = "",
    required this.deskripsi,
    required this.Judul,
    this.DT_tanggal = "",
    this.DT_jam = "",
    required this.isAddress,
    this.Address = "",
    this.HMD_personPic = "",
    required this.isAuthor,
    this.Author = "",
    required this.isCatHMD,
  });
  final bool isTime, isHeadMetadata, isAddress, isAuthor, isTimeDay, isCatHMD;
  final String HMD_personName,
      Author,
      Address,
      HMD_status,
      HMD_jenisAcara,
      HMD_personPic,
      deskripsi,
      Judul,
      DT_tanggal,
      DT_jam;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          JudulJadwal(judul: Judul),
          isTime
              ? DateTimeAcara(
                  isTimeDay: isTimeDay,
                  tanggal: DT_tanggal,
                  jam: DT_jam,
                )
              : SizedBox(),
          isAddress
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: AddressDetail(
                    address: Address,
                  ),
                )
              : SizedBox(),
          isAuthor
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: AuthorWidget(
                    address: Author,
                  ),
                )
              : SizedBox(),
          isHeadMetadata
              ? HeadDMetadata(
                  isCatHMD: isCatHMD,
                  imgUrl: HMD_personPic,
                  personname: HMD_personName,
                  status: HMD_status,
                  jenisacara: HMD_jenisAcara,
                )
              : SizedBox(),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Deskripsi",
                  style: Theme.of(context).textTheme.headlineSmall,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              child: Text(
                deskripsi,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.justify,
              ),
            ),
          )
        ],
      ),
    );
  }
}
