import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/common/widget/c_horizontal_card.dart';
import 'package:MobileGKI/common/widget/c_sliderhome.dart';
import 'package:MobileGKI/common/widget/c_vertical_card.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/acara/public_acaralisting.dart';
import 'package:MobileGKI/data/crud_state/pengunjung/pengunjunglisting.dart';
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
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../data/crud_state/pengunjung/public_pengunjunglisting.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PengunjungControllerPubHigligth RController =
      Get.put(PengunjungControllerPubHigligth());
  final AcaraControllerPublic AController = Get.put(AcaraControllerPublic());

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
                      textGrettings: FilemonText.homeAppbarTitle,
                      textUser: FilemonText.homeAppbarSubTitle,
                      areImage: false,
                    ),
                    menuSecHome()
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  FilemonHomeSlider(
                    autoplay: true,
                    banners: [
                      Filemonimages.slide1,
                      Filemonimages.slide2,
                      Filemonimages.slide3
                    ],
                  ),
                  ScrollablePositionedList.builder(
                      itemScrollController: RController.itemController,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: RController.pengunjung.length,
                      itemBuilder: (_, index) {
                        return Stack(children: [
                          InkWell(
                            onTap: () {},
                            child: Card(
                              elevation: 3,
                              child: Container(
                                  height: 230,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: 60,
                                              height: 60,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      "Total",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      RController
                                                          .pengunjung[index]
                                                          .total
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 60,
                                              height: 60,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      "Jemaat",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      RController
                                                          .pengunjung[index]
                                                          .jemaat_t
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 60,
                                              height: 60,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      "Partisipan",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    child: Text(
                                                      RController
                                                          .pengunjung[index]
                                                          .visit_t
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 60,
                                              height: 60,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      "Online",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      RController
                                                          .pengunjung[index]
                                                          .steam_count
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      HorizontalCard(
                                          isnetImgPendeta: true,
                                          tanggal: RController
                                              .pengunjung[index].jadwal_date!,
                                          tema: RController
                                              .pengunjung[index].jadwal_name!,
                                          nama_pendeta: RController
                                              .pengunjung[index].jadwal_host!,
                                          img_pendeta: ConfigBack.apiAdress +
                                              ConfigBack.imgInternet +
                                              RController.pengunjung[index]
                                                  .jadwal_host_img!,
                                          jenis_ibadah: RController
                                              .pengunjung[index].jadwal_type!,
                                          img_bg: ConfigBack.apiAdress +
                                              ConfigBack.imgInternet +
                                              RController
                                                  .pengunjung[index].jadwal_bg!,
                                          tempat: RController
                                              .pengunjung[index].jadwal_place!,
                                          isTempat: true)
                                    ],
                                  )),
                            ),
                          ),
                        ]);
                      }),
                  GridView.builder(
                      itemCount: AController.acara.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: FilemonSized.gridViewSpacing,
                              crossAxisSpacing: FilemonSized.gridViewSpacing,
                              mainAxisExtent: 222),
                      itemBuilder: (_, index) => GestureDetector(
                            onTap: () =>
                                Get.to(() => const BerandaProductPageDetail()),
                            child: FverticalCard(
                              tag: AController.acara[index].category_name,
                              title: AController.acara[index].name,
                              ImgUrl: AController.acara[index].pic,
                            ),
                          )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
