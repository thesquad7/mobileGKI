import 'package:MobileGKI/utils/constrains/colors.dart';
import 'package:flutter/material.dart';

class FilemonShadowStyle {
  static final verticalCard = BoxShadow(
      color: FilemonColor.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizontalCard = BoxShadow(
      color: FilemonColor.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
