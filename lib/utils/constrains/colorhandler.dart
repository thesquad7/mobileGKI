import 'dart:ffi';

import 'package:MobileGKI/utils/constrains/colors.dart';
import 'package:flutter/material.dart';

class CategoryColorHandler {
  CategoryColorHandler._();
  static List<Color> categorycolor = [
    FilemonColor.success,
    FilemonColor.secondary,
    FilemonColor.white,
    FilemonColor.black,
    FilemonColor.info,
    FilemonColor.borderPrimary,
    FilemonColor.accent,
    FilemonColor.warning,
    FilemonColor.error,
  ];

  static List<String> colorName = [
    "Hijau",
    'Kuning',
    "Putih",
    "Hitam",
    "Biru",
    "Abu Muda",
    "Biru Aksen",
    "Orange",
    "Merah"
  ];
}
