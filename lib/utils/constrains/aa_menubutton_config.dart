import 'package:MobileGKI/home/nested/aa_renungan_page.dart';
import 'package:MobileGKI/home/nested/adminarea_child/aa_acara_page.dart';
import 'package:MobileGKI/home/nested/adminarea_child/aa_jadwal_page.dart';
import 'package:MobileGKI/home/nested/adminarea_child/aa_jamkerja.dart';
import 'package:MobileGKI/home/nested/adminarea_child/aa_jemaat_page.dart';
import 'package:MobileGKI/home/nested/adminarea_child/aa_kritiksaran.dart';
import 'package:flutter/material.dart';

class FMenubuttonConfig {
  FMenubuttonConfig._();

  static List<String> menuname = [
    "Jemaat",
    "Keuangan",
    "Acara",
    "Jadwal",
    "Kesaksian",
    "Renungan",
    "Jam Kerja",
    "Saran&Kritik",
    "Keluar"
  ];
  static final screen = [
    const Jemaat(),
    const Jemaat(),
    const Acara(),
    const JadwalAdminArea(),
    const Jemaat(),
    const Renungan(),
    const JamKerja(),
    const KritikSaran(),
    const Jemaat()
  ];

  static List<IconData> menuIcon = [
    Icons.group,
    Icons.monetization_on_outlined,
    Icons.calendar_month,
    Icons.schedule_sharp,
    Icons.star,
    Icons.health_and_safety_rounded,
    Icons.work_history,
    Icons.feedback,
    Icons.exit_to_app_outlined
  ];
}
