import 'package:MobileGKI/common/widget/c_addressdetail.dart';
import 'package:MobileGKI/common/widget/c_jadwal_date_time.dart';
import 'package:MobileGKI/common/widget/c_jadwal_judul.dart';
import 'package:MobileGKI/common/widget/c_jadwal_metadata.dart';
import 'package:flutter/material.dart';

class FDetailPage extends StatelessWidget {
  const FDetailPage({
    super.key,
    required this.isTime,
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
  });
  final bool isTime, isHeadMetadata, isAddress;
  final String HMD_personName,
      Address,
      HMD_status,
      HMD_jenisAcara,
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
                  tanggal: DT_tanggal,
                  jam: DT_jam,
                )
              : SearchBar(),
          isAddress
              ? AddressDetail(
                  address: Address,
                )
              : SizedBox(),
          isHeadMetadata
              ? HeadDMetadata(
                  personname: HMD_personName,
                  status: HMD_status,
                  jenisacara: HMD_jenisAcara,
                )
              : SizedBox(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Deskripsi",
                  style: Theme.of(context).textTheme.headlineSmall,
                )),
          ),
          SizedBox(
            height: 400,
            child: Text(
              deskripsi,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          )
        ],
      ),
    );
  }
}
