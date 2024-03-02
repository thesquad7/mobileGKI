import 'package:MobileGKI/home/nested/beranda_child/b_menu_acara_page.dart';
import 'package:MobileGKI/home/nested/beranda_child/b_menu_jadwaltu_page.dart';
import 'package:MobileGKI/home/nested/beranda_child/b_menu_kesaksian.dart';
import 'package:MobileGKI/home/nested/beranda_child/b_menu_renungan_page.dart';
import 'package:flutter/material.dart';

class berandaMenuConfig {
  berandaMenuConfig._();

  static final List<String> judulMenu = [
    "Kesaksian",
    "Acara",
    "Keuangan",
    "Jadwal TU",
    "Renungan",
    "Saran&Kritik"
  ];
  static List<IconData> iconMenu = [
    Icons.star_outlined,
    Icons.event,
    Icons.monetization_on,
    Icons.schedule_rounded,
    Icons.doorbell,
    Icons.feedback
  ];

  static final screen = [
    const KesaksianBeranda(),
    const MenuAcaraBeranda(),
    const KesaksianBeranda(),
    const JadwalTUBeranda(),
    const RenunganBeranda(),
    const KesaksianBeranda(),
  ];
}
