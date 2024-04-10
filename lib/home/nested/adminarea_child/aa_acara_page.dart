import 'package:MobileGKI/common/widget/c_fmanagementpage.dart';
import 'package:MobileGKI/common/widget/c_horizontal_card.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:flutter/material.dart';

class Acara extends StatelessWidget {
  const Acara({super.key});

  @override
  Widget build(BuildContext context) {
    return FManagementPageDesign(
        searchbutton: true,
        search: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        autokeepalive: false,
        itemCount: 7,
        floatAButton: true,
        child: (_, index) {
          return Stack(children: [
            HorizontalCard(
                tanggal: "25 Maret 2024",
                tempat: "GKI Eretan",
                tema: "",
                nama_pendeta: "Sdr.Daniel",
                img_pendeta: Filemonimages.pendeta2,
                jenis_ibadah: "Ibadah Umum",
                img_bg: Filemonimages.product4),
            Positioned(
              right: 20,
              top: 20,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.amber[50],
                ),
                child: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
              ),
            )
          ]);
        },
        pageTitle: "Acara");
  }
}
