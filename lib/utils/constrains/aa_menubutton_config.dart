import 'package:MobileGKI/home/nested/adminarea_child/aa_jadwal_menu.dart';
import 'package:MobileGKI/home/nested/adminarea_child/aa_acara_menu.dart';
import 'package:MobileGKI/home/nested/adminarea_child/aa_jamkerja.dart';
import 'package:MobileGKI/home/nested/adminarea_child/kesaksian_menu/list_aamk_kesaksian.dart';
import 'package:MobileGKI/home/nested/adminarea_child/persona/aap_jemaat_page.dart';
import 'package:MobileGKI/home/nested/adminarea_child/aa_persona.dart';
import 'package:MobileGKI/home/nested/adminarea_child/persona/aap_pendeta_page.dart';
import 'package:MobileGKI/utils/helper/img_cropper.dart';
import 'package:flutter/material.dart';

import '../../home/nested/adminarea_child/aa_renungan_menu.dart';
import '../../home/nested/adminarea_child/feedback/list_aamf_feedback.dart';
import '../../home/nested/adminarea_child/pengunjung/list_aamp_pengunjung.dart';

class FMenubuttonConfig {
  FMenubuttonConfig._();

  static List<String> menuname = [
    "Persona",
    "Pengunjung",
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
    PengunjungungAdmin(),
    AcaraMenu(),
    JadwalMenu(),
    KekasaksianAdmin(),
    RenunganMenu(),
    const JamKerja(),
    FeedbackAdmin()
  ];

  static List<IconData> menuIcon = [
    Icons.group,
    Icons.view_stream,
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
    "Tempat Ibadah",
    "Kategori",
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
    Icons.church,
    Icons.flag,
  ];
}

class FAcaraMenu {
  FAcaraMenu._();

  static List<String> menuname = [
    "Category",
    "Acara",
  ];

  static List<IconData> menuIcon = [
    Icons.flag,
    Icons.calendar_month,
  ];
}

class FJadwalMenu {
  FJadwalMenu._();

  static List<String> menuname = [
    "Category",
    "Jadwal Ibadah",
  ];

  static List<IconData> menuIcon = [
    Icons.flag,
    Icons.calendar_month,
  ];
}

class FRenunganmenu {
  FRenunganmenu._();

  static List<String> menuname = [
    "Category",
    "Renungan",
  ];

  static List<IconData> menuIcon = [
    Icons.flag,
    Icons.book,
  ];
}
