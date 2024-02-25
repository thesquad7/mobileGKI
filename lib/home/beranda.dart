import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/common/widget/c_sliderhome.dart';
import 'package:MobileGKI/common/widget/c_vertical_card.dart';
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
    List<String> imgberanda;
    imgberanda = [
      Filemonimages.product1,
      Filemonimages.product2,
      Filemonimages.product3,
      Filemonimages.product4,
    ];
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
                      are2line: true,
                      areAction: true,
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
              child: Column(
                children: [
                  FilemonHomeSlider(
                    autoplay: false,
                    banners: [
                      Filemonimages.slide1,
                      Filemonimages.slide2,
                      Filemonimages.slide3
                    ],
                  ),
                  SizedBox(height: FilemonSized.spaceBtwItems),
                  Padding(
                    padding: const EdgeInsets.all(FilemonSized.borderRadiusMd),
                    child: GridView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: FilemonSized.gridViewSpacing,
                                crossAxisSpacing: FilemonSized.gridViewSpacing,
                                mainAxisExtent: 222),
                        itemBuilder: (_, index) => FverticalCard(
                              ImgUrl: imgberanda[index].toString(),
                            )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
