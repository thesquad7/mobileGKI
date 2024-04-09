import 'package:MobileGKI/app.dart';
import 'package:MobileGKI/home/nested/aa_renungan_page.dart';
import 'package:MobileGKI/home/nested/adminarea_child/aa_acara_page.dart';
import 'package:MobileGKI/home/nested/adminarea_child/aa_jadwal_page.dart';
import 'package:MobileGKI/home/nested/adminarea_child/aa_jamkerja.dart';
import 'package:MobileGKI/home/nested/adminarea_child/persona/aa_jemaat_page.dart';
import 'package:MobileGKI/home/nested/adminarea_child/aa_kritiksaran.dart';
import 'package:MobileGKI/home/nested/adminarea_child/aa_persona.dart';
import 'package:MobileGKI/home/nested/adminarea_child/persona/aap_pendeta_page.dart';
import 'package:MobileGKI/utils/helper/img_cropper.dart';
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
    Persona(),
    Jemaat(),
    const Acara(),
    const JadwalAdminArea(),
    Jemaat(),
    const Renungan(),
    const JamKerja(),
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

class FPersona {
  FPersona._();

  static List<String> menuname = [
    "Pendeta",
    "Jemaat",
    "Kategory",
  ];
  static final screen = [
    Pendeta(),
    Jemaat(),
    HomePage(
      title: "Edit Image",
    )
  ];

  static List<IconData> menuIcon = [
    Icons.sensor_occupied_sharp,
    Icons.person,
    Icons.flag,
  ];
}
