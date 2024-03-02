import 'package:MobileGKI/common/widget/c_fmanagementpage.dart';
import 'package:MobileGKI/common/widget/c_jamkerjacard.dart';
import 'package:MobileGKI/utils/constrains/jamkerja_contoh.dart';
import 'package:flutter/material.dart';

class JamKerja extends StatelessWidget {
  const JamKerja({super.key});

  @override
  Widget build(BuildContext context) {
    return FManagementPageDesign(
        searchbutton: false,
        child: (_, index) {
          return FJadwalCard(
              hari: JamKerjaConfig.hari[index],
              jamMulai: JamKerjaConfig.waktuMulai[index],
              jamSelesai: JamKerjaConfig.waktuSelesai[index],
              operasional: JamKerjaConfig.operasional[index]);
        },
        pageTitle: "Jam Kerja",
        itemCount: 7,
        floatAButton: true,
        autokeepalive: true);
  }
}
