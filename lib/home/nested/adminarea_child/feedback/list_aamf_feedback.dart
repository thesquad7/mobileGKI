// ignore_for_file: unused_import, sized_box_for_whitespace, non_constant_identifier_names, use_build_context_synchronously, use_super_parameters

import 'dart:developer';
import 'package:MobileGKI/common/widget/c_fhorizontalcardImgbg.dart';
import 'package:MobileGKI/common/widget/c_horizontal_card.dart';
import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/acara/acaralisting.dart';
import 'package:MobileGKI/data/crud_state/acara/acaraview.dart';
import 'package:MobileGKI/data/crud_state/feedback/feedbacklisting.dart';
import 'package:MobileGKI/data/crud_state/feedback/feedbackview.dart';
import 'package:MobileGKI/data/crud_state/jadwal/jadwallisting.dart';
import 'package:MobileGKI/data/crud_state/jadwal/jadwalview.dart';
import 'package:MobileGKI/data/crud_state/kesaksian/kesaksianview.dart';
import 'package:MobileGKI/data/crud_state/pendeta/pendetalisting.dart';
import 'package:MobileGKI/data/crud_state/pendeta/pendetaview.dart';
import 'package:MobileGKI/home/nested/adminarea_child/acara_menu/aama_category_persona.dart';
import 'package:MobileGKI/home/nested/adminarea_child/acara_menu/crud_aama_acara.dart';
import 'package:MobileGKI/home/nested/adminarea_child/edit/crud_pendeta.dart';
import 'package:MobileGKI/home/nested/adminarea_child/jadwal_menu/crud_aaj_jadwal.dart';
import 'package:MobileGKI/home/nested/adminarea_child/kesaksian_menu/crud_aamk_kesaksian.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:MobileGKI/utils/constrains/colorhandler.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../../data/crud_state/kesaksian/kesaksianlisting.dart';
import '../../../../utils/constrains/colors.dart';

class FeedbackAdmin extends StatefulWidget {
  FeedbackAdmin({
    Key? key,
  }) : super(key: key);

  @override
  State<FeedbackAdmin> createState() => _FeedbackAdmin();
}

class _FeedbackAdmin extends State<FeedbackAdmin> {
  final FeedbackController KController = Get.put(FeedbackController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);
    return Scaffold(
      extendBody: true,
      appBar: _buildAppbar(dark),
      body: Obx(
        () => SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: KController.isInternetConnect.value
              ? KController.isLoading.value
                  ? _buildLoading(context)
                  : _buildBody()
              : _buildNoInternetConnection(context),
        ),
      ),
    );
  }

  Widget _buildNoInternetConnection(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 180,
            height: 180,
            child: Lottie.asset('assets/b.json'),
          ),
          MaterialButton(
            minWidth: 130,
            height: 45,
            onPressed: () => _materialOnTapButton(context),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: FilemonColor.primary,
            child: const Text(
              "Try Again",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

  Center _buildLoading(context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);
    return Center(
      child: SizedBox(
        height: FilemonHelperFunctions.screenHeight(),
        width: FilemonHelperFunctions.screenWidth(),
        child: dark
            ? Lottie.asset(FilemonAnime.listloading_dark)
            : Lottie.asset(FilemonAnime.listloading),
      ),
    );
  }

  Widget _buildBody() {
    return LiquidPullToRefresh(
      backgroundColor: Colors.red,
      color: Colors.transparent,
      showChildOpacityTransition: false,
      animSpeedFactor: 2.1,
      onRefresh: () {
        KController.remData();
        return KController.getData();
      },
      child: ScrollablePositionedList.builder(
          itemScrollController: KController.itemController,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: KController.kesaksian.length,
          itemBuilder: (_, index) {
            return InkWell(
                onTap: () async {
                  await APIGetFeedbackFView(
                          acaraId: KController.kesaksian[index].id.toString())
                      .getJadwal();
                },
                child: FHorizontalCardImgBG(
                    imgUrl: ConfigBack.apiAdress +
                        ConfigBack.imgInternet +
                        KController.kesaksian[index].pic,
                    judul: KController.kesaksian[index].name,
                    category: KController.kesaksian[index].tanggal,
                    author: KController.kesaksian[index].content));
          }),
    );
  }

  AppBar _buildAppbar(bool dark) {
    return AppBar(
      leading: Center(
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: dark
                  ? FilemonColor.white.withOpacity(0.3)
                  : FilemonColor.dark.withOpacity(0.7),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                size: 20,
                color: dark ? Colors.black : Colors.white,
              )),
        ),
      ),
      title: const Text("Kritik & Saran"),
    );
  }

  void _materialOnTapButton(BuildContext context) async {
    if (await InternetConnectionChecker().hasConnection == true) {
      KController.getData();
    } else {
      FilemonHelperFunctions.showSnackBar(context.toString());
    }
  }
}
