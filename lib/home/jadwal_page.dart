import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/common/widget/c_horizontal_card.dart';
import 'package:MobileGKI/home/nested/j_detail.dart';
import 'package:MobileGKI/home/d_config/widget/b_appbar.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Jadwal extends StatelessWidget {
  const Jadwal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          FilemonPrimaryHeaderCon(
            color: Colors.brown,
            height: FilemonSized.appBarHeight * 2.2,
            child: Column(children: [
              berandaAppbar(
                title: "Jadwal Sepekan",
              ),
            ]),
          ),
          GestureDetector(
            onTap: () => Get.to(() => const FDetailJadwal()),
            child: HorizontalCard(
                tanggal: "10 Maret 2024",
                tempat: "GKI Indramayu",
                tema: "Melayani Tuhan",
                nama_pendeta: "Pdt.Markus",
                img_pendeta: Filemonimages.pendeta1,
                jenis_ibadah: "Ibadah Umum",
                img_bg: Filemonimages.slide2),
          ),
          HorizontalCard(
              tanggal: "18 Maret 2024",
              tempat: "GKI Indramayu",
              tema: "Indah Bersama sang Dambaan",
              nama_pendeta: "Pdt.Tiwan",
              img_pendeta: Filemonimages.pendeta2,
              jenis_ibadah: "Ibadah Umum Muda",
              img_bg: Filemonimages.product2),
          HorizontalCard(
              tanggal: "25 Maret 2024",
              tempat: "GKI Eretan",
              tema: "Tulus dengan Mu",
              nama_pendeta: "Pdt.Andela",
              img_pendeta: Filemonimages.pendeta3,
              jenis_ibadah: "Ibadah Umum",
              img_bg: Filemonimages.product3),
          HorizontalCard(
              tanggal: "25 Maret 2024",
              tempat: "GKI Jatibarang",
              tema: "Tulus dengan Mu",
              nama_pendeta: "Pdt.Andela",
              img_pendeta: Filemonimages.pendeta3,
              jenis_ibadah: "Komsel Akbar",
              img_bg: Filemonimages.slide1),
          HorizontalCard(
              tanggal: "25 Maret 2024",
              tempat: "GKI Eretan",
              tema: "Tulus dengan Mu",
              nama_pendeta: "Pdt.Tiwan",
              img_pendeta: Filemonimages.pendeta2,
              jenis_ibadah: "Ibadah Umum",
              img_bg: Filemonimages.product4),
          HorizontalCard(
              tanggal: "25 Maret 2024",
              tempat: "GKI Eretan",
              tema: "Tulus dengan Mu",
              nama_pendeta: "Pdt.Tiwan",
              img_pendeta: Filemonimages.pendeta2,
              jenis_ibadah: "Ibadah Umum",
              img_bg: Filemonimages.product1),
        ]),
      ),
    );
  }
}
