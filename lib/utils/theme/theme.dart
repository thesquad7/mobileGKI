import 'package:MobileGKI/utils/theme/costum_theme/appbar_theme.dart';
import 'package:MobileGKI/utils/theme/costum_theme/bottom_sheet_theme.dart';
import 'package:MobileGKI/utils/theme/costum_theme/checkbox_theme.dart';
import 'package:MobileGKI/utils/theme/costum_theme/chip_theme.dart';
import 'package:MobileGKI/utils/theme/costum_theme/elevated_button_theme.dart';
import 'package:MobileGKI/utils/theme/costum_theme/outline_button_theme.dart';
import 'package:MobileGKI/utils/theme/costum_theme/text_theme.dart';
import 'package:MobileGKI/utils/theme/costum_theme/textfield_theme.dart';
import 'package:flutter/material.dart';

class FilemonAppTheme {
  FilemonAppTheme._();

  static ThemeData temaTerang = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: FilemonTextTheme.terangTextTheme,
      chipTheme: FilemonChipTheme.terangChipTheme,
      appBarTheme: FilemonAppBarTheme.terangAppbarTheme,
      checkboxTheme: FilemonCheckboxTheme.terangCheckboxTheme,
      elevatedButtonTheme: FilemonElevatedBottonTheme.terangElevatedButtonTheme,
      bottomSheetTheme: FilemonBottomSheetTheme.terangBottomSheetTheme,
      outlinedButtonTheme: FilemonOutlineButtonTheme.terangOutlineButtonTheme,
      inputDecorationTheme: FilemonTextFieldTheme.terangInputDecorationTheme);

  static ThemeData temaGelap = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: FilemonTextTheme.gelapTextTheme,
      chipTheme: FilemonChipTheme.gelapChipTheme,
      appBarTheme: FilemonAppBarTheme.gelapAppbarTheme,
      checkboxTheme: FilemonCheckboxTheme.gelapCheckboxTheme,
      elevatedButtonTheme: FilemonElevatedBottonTheme.gelapElevatedButtonTheme,
      bottomSheetTheme: FilemonBottomSheetTheme.gelapBottomSheetTheme,
      outlinedButtonTheme: FilemonOutlineButtonTheme.gelapOutlineButtonTheme,
      inputDecorationTheme: FilemonTextFieldTheme.gelapInputDecorationTheme);
}
