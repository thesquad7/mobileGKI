import 'package:MobileGKI/common/widget/c_fmanagementpage.dart';
import 'package:MobileGKI/common/widget/c_jamkerjacard.dart';
import 'package:MobileGKI/utils/constrains/jamkerja_contoh.dart';
import 'package:flutter/material.dart';

class JadwalTUBeranda extends StatelessWidget {
  const JadwalTUBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return FManagementPageDesign(
        child: (_, index) {
          return FJadwalCard(
              hari: JamKerjaConfig.hari[index],
              jamMulai: JamKerjaConfig.waktuMulai[index],
              jamSelesai: JamKerjaConfig.waktuSelesai[index],
              operasional: JamKerjaConfig.operasional[index]);
        },
        pageTitle: "Jadwal Tata Usaha",
        itemCount: 7,
        autokeepalive: false,
        searchbutton: false);
  }
}
