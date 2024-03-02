import 'package:MobileGKI/common/widget/c_fmanagementpage.dart';
import 'package:MobileGKI/common/widget/c_horizontal_card.dart';
import 'package:MobileGKI/home/nested/adminarea_child/edit/crud_aa_jadwal.dart';
import 'package:MobileGKI/utils/constrains/b_string_adminarea_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class JadwalAdminArea extends StatelessWidget {
  const JadwalAdminArea({super.key});

  @override
  Widget build(BuildContext context) {
    final indexitem = GetStorage();
    return FManagementPageDesign(
        floatAButton: true,
        onPressed: () {
          print("this is Route");
        },
        pageTitle: "Jadwal",
        itemCount: 5,
        autokeepalive: false,
        searchbutton: false,
        child: (_, index) {
          return InkWell(
            onTap: () {
              indexitem.write("index", index);
              Get.to(() => const JadwalCRUD());
            },
            child: HorizontalCard(
                tanggal: JadwalText.jadwalTanggal[index],
                tempat: JadwalText.jadwalAlamat[index],
                tema: JadwalText.jadwalTitle[index],
                nama_pendeta: JadwalText.jadwalAuthor[index],
                img_pendeta: JadwalText.jadwalImgPerson[index],
                jenis_ibadah: JadwalText.jadwalStatus[index],
                img_bg: JadwalText.jadwalImgBG[index]),
          );
        });
  }
}
