import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/common/widget/c_sliderhome.dart';
import 'package:MobileGKI/common/widget/c_vertical_card.dart';
import 'package:MobileGKI/home/d_config/widget/b_appbar.dart';
import 'package:MobileGKI/home/d_config/widget/b_menuSection.dart';
import 'package:MobileGKI/home/nested/beranda_child/b_productpagedetail.dart';
import 'package:MobileGKI/init/onboardingscreen.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:MobileGKI/utils/theme/constrains/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceStorage = GetStorage();
    final userStatus = deviceStorage.read("useradmin");
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
                      areAction: userStatus,
                      exitbutton: IconButton(
                          onPressed: () {
                            deviceStorage.write("isFirstTime", true);
                            deviceStorage.write("userlogin", false);
                            Get.offAll(OnboardingScreen());
                          },
                          icon: const Icon(Icons.exit_to_app_outlined)),
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
                        itemBuilder: (_, index) => GestureDetector(
                              onTap: () => Get.to(
                                  () => const BerandaProductPageDetail()),
                              child: FverticalCard(
                                ImgUrl: imgberanda[index].toString(),
                              ),
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
