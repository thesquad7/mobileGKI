import 'package:MobileGKI/common/widget/c_fmanagementpage.dart';
import 'package:MobileGKI/common/widget/c_horizontal_card.dart';
import 'package:MobileGKI/home/nested/beranda_child/beranda_menu_detail/bd_kesasian_page.dart';
import 'package:MobileGKI/utils/constrains/b_string_menu_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class KesaksianBeranda extends StatelessWidget {
  const KesaksianBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    return FManagementPageDesign(
        child: (_, index) {
          return InkWell(
            onTap: () {
              box.write("index", index);
              Get.to(() => DetailKesaksianBeranda());
            },
            child: HorizontalCard(
                tanggal: FBerandaTextData.kesaksianTanggal[index],
                tempat: FBerandaTextData.kesaksianAlamat[index],
                tema: FBerandaTextData.kesaksianTitle[index],
                nama_pendeta: FBerandaTextData.kesaksianAuthor[index],
                img_pendeta: FBerandaTextData.kesaksianImgPerson[index],
                jenis_ibadah: FBerandaTextData.kesaksianSub[index],
                img_bg: FBerandaTextData.kesaksianImgBG[index]),
          );
        },
        pageTitle: "Kesaksian",
        itemCount: 6,
        search: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        autokeepalive: false,
        searchbutton: true);
  }
}
