import 'package:MobileGKI/home/nested/beranda_child/b_menu_acara_page.dart';
import 'package:MobileGKI/home/nested/beranda_child/b_menu_feeback.dart';
import 'package:MobileGKI/home/nested/beranda_child/b_menu_jadwaltu_page.dart';
import 'package:MobileGKI/home/nested/beranda_child/b_menu_kesaksian.dart';
import 'package:flutter/material.dart';

import '../../home/nested/beranda_child/b_menu_pengunjung.dart';
import '../../home/nested/beranda_child/list_aamr_renungan.dart';

class berandaMenuConfig {
  berandaMenuConfig._();

  static final List<String> judulMenu = [
    "Kesaksian",
    "Acara",
    "Pengunjung",
    "Jadwal TU",
    "Renungan",
    "Saran&Kritik"
  ];
  static List<IconData> iconMenu = [
    Icons.emoji_people_sharp,
    Icons.event,
    Icons.view_stream,
    Icons.schedule_rounded,
    Icons.doorbell,
    Icons.feedback
  ];

  static final screen = [
    KesaksianBeranda(),
    MenuAcaraBeranda(),
    PengunjungPublic(),
    const JadwalTUBeranda(),
    RenunganBeranda(),
    const BerandaFeedback(),
  ];
}
