import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/home/d_config/widget/b_appbar.dart';
import 'package:MobileGKI/home/d_config/widget/b_catitem.dart';
import 'package:MobileGKI/home/d_config/widget/b_headcat.dart';
import 'package:MobileGKI/home/d_config/widget/b_menuSection.dart';
import 'package:MobileGKI/utils/theme/constrains/colors.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FilemonPrimaryHeaderCon(
                child: Column(
              children: [berandaAppbar(), menuSecHome()],
            ))
          ],
        ),
      ),
    );
  }
}
