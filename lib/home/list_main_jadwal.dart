// ignore_for_file: unused_import

import 'dart:developer';
import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/common/widget/c_horizontal_card.dart';
import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/acara/acaralisting.dart';
import 'package:MobileGKI/data/crud_state/acara/acaraview.dart';
import 'package:MobileGKI/data/crud_state/jadwal/jadwallisting.dart';
import 'package:MobileGKI/data/crud_state/jadwal/jadwalview.dart';
import 'package:MobileGKI/data/crud_state/jadwal/public_list_jadwal.dart';
import 'package:MobileGKI/data/crud_state/pendeta/pendetalisting.dart';
import 'package:MobileGKI/data/crud_state/pendeta/pendetaview.dart';
import 'package:MobileGKI/home/d_config/widget/b_appbar.dart';
import 'package:MobileGKI/home/nested/adminarea_child/acara_menu/aama_category_persona.dart';
import 'package:MobileGKI/home/nested/adminarea_child/acara_menu/crud_aama_acara.dart';
import 'package:MobileGKI/home/nested/adminarea_child/edit/crud_pendeta.dart';
import 'package:MobileGKI/home/nested/adminarea_child/jadwal_menu/crud_aaj_jadwal.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:MobileGKI/utils/constrains/colorhandler.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../../utils/constrains/colors.dart';

class Jadwal extends StatelessWidget {
  Jadwal({
    Key? key,
  }) : super(key: key);

  final JadwalPublicController JController = Get.put(JadwalPublicController());
  late DateTime tanggal_convert;
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
          child: JController.isInternetConnect.value
              ? JController.isLoading.value
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
        JController.remJadwal();
        return JController.getJadwal();
      },
      child: ScrollablePositionedList.builder(
          itemScrollController: JController.itemController,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: JController.jadwal.length,
          itemBuilder: (_, index) {
            tanggal_convert = FilemonHelperFunctions.dateFormat
                .parse(JController.jadwal[index].tanggal);
            return InkWell(
                onTap: () async {
                  GetStorage().write("data", true);
                  GetStorage().write("pagetitle", "Perbaharui Acara");
                  await APIGetJadwalViewPublic(
                          acaraId: JController.jadwal[index].id.toString())
                      .getJadwal();
                },
                child: HorizontalCard(
                    top_color: CategoryColorHandler
                        .categorycolor[JController.jadwal[index].color_id!],
                    bottom_color: Colors.amber,
                    isTempat: true,
                    tanggal: DateFormat.yMMMEd('id_ID').format(tanggal_convert),
                    tempat: JController.jadwal[index].place,
                    tema: JController.jadwal[index].name,
                    nama_pendeta: JController.jadwal[index].pendeta,
                    isnetImgPendeta: true,
                    img_pendeta: ConfigBack.apiAdress +
                        ConfigBack.imgInternet +
                        JController.jadwal[index].pendeta_pic,
                    jenis_ibadah: JController.jadwal[index].category_name,
                    img_bg: ConfigBack.apiAdress +
                        ConfigBack.imgInternet +
                        JController.jadwal[index].pic));
          }),
    );
  }

  AppBar _buildAppbar(bool dark) {
    return AppBar(
      automaticallyImplyLeading: false, // Remove the default leading widget
      toolbarHeight: FilemonSized.appBarHeight * 1.2, // Adjust height as needed
      flexibleSpace: FilemonPrimaryHeaderCon(
        color: Colors.brown,
        height: FilemonSized.appBarHeight * 2.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            berandaAppbar(
              title: "Jadwal Sepekan",
            ),
          ],
        ),
      ),
    );
  }

  void _materialOnTapButton(BuildContext context) async {
    if (await InternetConnectionChecker().hasConnection == true) {
      JController.getJadwal();
    } else {
      FilemonHelperFunctions.showSnackBar(context.toString());
    }
  }
}
