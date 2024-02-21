import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/common/widget/c_sliderhome.dart';
import 'package:MobileGKI/home/d_config/widget/b_appbar.dart';
import 'package:MobileGKI/home/d_config/widget/b_menuSection.dart';
import 'package:MobileGKI/utils/constrains/image_string.dart';
import 'package:MobileGKI/utils/theme/constrains/c_circlecontainer.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
            )),
            Padding(
              padding: const EdgeInsets.all(FilemonSized.defaultSpace),
              child: FilemonHomeSlider(
                banners: [
                  Filemonimages.slide1,
                  Filemonimages.slide2,
                  Filemonimages.slide3
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
