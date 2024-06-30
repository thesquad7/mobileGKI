import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/common/widget/c_pengunjung_static.dart';
import 'package:MobileGKI/common/widget/c_sliderhome.dart';
import 'package:MobileGKI/common/widget/c_vertical_card.dart';
import 'package:MobileGKI/data/crud_state/acara/public_acaralisting.dart';
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
import 'package:shimmer/shimmer.dart';

import '../common/widget/c_shimmercard.dart';
import '../data/crud_state/pengunjung/public_pengunjunglisting.dart';
import '../utils/helper/helper_function.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PengunjungControllerPubHigligth RController =
      Get.put(PengunjungControllerPubHigligth());
  final AcaraControllerPublic AController = Get.put(AcaraControllerPublic());
  late bool refresh;
  @override
  void initState() {
    refresh = false;
    super.initState();
  }

  loadingNewData() {
    AController.remAcara();
    RController.remData();
    AController.getAcara();
    RController.getData();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        refresh = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceStorage = GetStorage();
    final userStatus = deviceStorage.read("useradmin");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: refresh
              ? Center(child: CircularProgressIndicator())
              : Icon(Icons.refresh),
          onPressed: refresh
              ? null
              : () {
                  setState(() {
                    refresh = true;
                  });
                  loadingNewData();
                }),
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
                            Get.offAll(() => OnboardingScreen());
                          },
                          icon: const Icon(Icons.exit_to_app_outlined)),
                      textGrettings: FilemonText.homeAppbarTitle,
                      textUser: FilemonText.homeAppbarSubTitle,
                      areImage: false,
                    ),
                    const menuSecHome()
                  ],
                )),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const FilemonHomeSlider(
                      autoplay: true,
                      banners: [
                        Filemonimages.slide1,
                        Filemonimages.slide2,
                        Filemonimages.slide3
                      ],
                    ),
                    SizedBox(height: 15),
                    RController.isLoading.value
                        ? _buildLoading(context)
                        : _buildPengunjung(),
                    AController.isLoading.value
                        ? _buildLoadingKesaksian()
                        : _buildKesaksian()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPengunjung() {
    return ScrollablePositionedList.builder(
        itemScrollController: RController.itemController,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: RController.pengunjung.length,
        itemBuilder: (_, index) => InkWell(
            onTap: () {},
            child: PengunjungCardCount(
                total: RController.pengunjung[index].total.toString(),
                t_jemaat: RController.pengunjung[index].jemaat_t.toString(),
                t_visit: RController.pengunjung[index].visit_t.toString(),
                stream: RController.pengunjung[index].steam_count.toString(),
                pdt_name: RController.pengunjung[index].jadwal_host.toString(),
                j_name: RController.pengunjung[index].jadwal_name.toString(),
                j_cat: RController.pengunjung[index].jadwal_type.toString(),
                j_bg: RController.pengunjung[index].jadwal_bg.toString(),
                j_date: RController.pengunjung[index].jadwal_date.toString(),
                pdt_img:
                    RController.pengunjung[index].jadwal_host_img.toString(),
                j_place:
                    RController.pengunjung[index].jadwal_place.toString())));
  }

  Widget _buildKesaksian() {
    return GridView.builder(
        itemCount: AController.acara.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: FilemonSized.gridViewSpacing,
            crossAxisSpacing: FilemonSized.gridViewSpacing,
            mainAxisExtent: 220),
        itemBuilder: (_, index) => GestureDetector(
              onTap: () => Get.to(() => const BerandaProductPageDetail()),
              child: FverticalCard(
                tag: AController.acara[index].category_name,
                title: AController.acara[index].name,
                ImgUrl: AController.acara[index].pic,
              ),
            ));
  }

  Center _buildLoading(context) {
    return Center(
        child: SizedBox(
      width: FilemonHelperFunctions.screenWidth(),
      height: 230,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade200,
        child: ScrollablePositionedList.builder(
            itemScrollController: RController.itemController,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (_, index) {
              return FShimmerCard();
            }),
      ),
    ));
  }

  Center _buildLoadingKesaksian() {
    return Center(
        child: SizedBox(
      width: FilemonHelperFunctions.screenWidth(),
      height: 300,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade200,
        child: GridView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: FilemonSized.gridViewSpacing,
                crossAxisSpacing: FilemonSized.gridViewSpacing,
                mainAxisExtent: 220),
            itemBuilder: (_, index) => GestureDetector(
                  onTap: () => Get.to(() => const BerandaProductPageDetail()),
                  child: FShimmerVerticalCard(),
                )),
      ),
    ));
  }
}
