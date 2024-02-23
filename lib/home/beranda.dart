import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/common/widget/c_sliderhome.dart';
import 'package:MobileGKI/home/d_config/widget/b_appbar.dart';
import 'package:MobileGKI/home/d_config/widget/b_menuSection.dart';
import 'package:MobileGKI/utils/constrains/image_string.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:MobileGKI/utils/theme/constrains/text.dart';
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
                color: Colors.amber,
                height: 250,
                child: Column(
                  children: [
                    berandaAppbar(
                      Imgurl: "null",
                      icon: Icon(Icons.calendar_month),
                      textGrettings: FilemonText.homeAppbarTitle,
                      textUser: FilemonText.homeAppbarSubTitle,
                      areImage: false,
                    ),
                    menuSecHome()
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(0),
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
