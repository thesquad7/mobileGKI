// ignore_for_file: unused_import

import 'dart:developer';
import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/acara/acaralisting.dart';
import 'package:MobileGKI/data/crud_state/acara/acaraview.dart';
import 'package:MobileGKI/data/crud_state/pendeta/pendetalisting.dart';
import 'package:MobileGKI/data/crud_state/pendeta/pendetaview.dart';
import 'package:MobileGKI/home/nested/adminarea_child/acara_menu/aama_category_persona.dart';
import 'package:MobileGKI/home/nested/adminarea_child/acara_menu/crud_aama_acara.dart';
import 'package:MobileGKI/home/nested/adminarea_child/edit/crud_pendeta.dart';
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
import '../../../../utils/constrains/colors.dart';

class Jadwal extends StatelessWidget {
  Jadwal({
    Key? key,
  }) : super(key: key);

  final AcaraController AController = Get.put(AcaraController());

  @override
  Widget build(BuildContext context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);
    return Scaffold(
      extendBody: true,
      appBar: _buildAppbar(dark),
      floatingActionButton: FloatingActionButton.small(
          child: const Icon(Icons.add),
          onPressed: () {
            GetStorage().write("data", false);
            GetStorage().write("pagetitle", "Tambah Pendeta");
            Get.to(() => EditAcara(
                  isNImg: false,
                ));
          }),
      body: Obx(
        () => SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: AController.isInternetConnect.value
              ? AController.isLoading.value
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
      color: Colors.blue,
      showChildOpacityTransition: false,
      animSpeedFactor: 2.1,
      onRefresh: () {
        AController.remAcara();
        return AController.getAcara();
      },
      child: ScrollablePositionedList.builder(
          itemScrollController: AController.itemController,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: AController.acara.length,
          itemBuilder: (_, index) {
            return AcaraItem(
                indexCat: AController.acara[index].color_id!,
                catName: AController.acara[index].category_name,
                nama: AController.acara[index].name,
                status: AController.acara[index].status,
                imngUrl: AController.acara[index].pic,
                Edit: () async {
                  GetStorage().write("data", true);
                  GetStorage().write("pagetitle", "Perbaharui Acara");
                  await APIGetAcaraView(
                          acaraId: AController.acara[index].id.toString())
                      .getAcara();
                });
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
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                size: 20,
                color: dark ? Colors.black : Colors.white,
              )),
        ),
      ),
      title: Text("Acara"),
    );
  }

  void _materialOnTapButton(BuildContext context) async {
    if (await InternetConnectionChecker().hasConnection == true) {
      AController.getAcara();
    } else {
      FilemonHelperFunctions.showSnackBar(context.toString());
    }
  }
}

class AcaraItem extends StatelessWidget {
  const AcaraItem({
    super.key,
    required this.nama,
    required this.status,
    required this.catName,
    required this.imngUrl,
    required this.indexCat,
    required this.Edit,
  });
  final String nama, status, imngUrl, catName;
  final int indexCat;
  final VoidCallback Edit;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        child: Stack(children: [
          Container(
              width: double.infinity,
              height: 150,
              child: ClipRRect(
                  child: Image.network(
                    ConfigBack.apiAdress + ConfigBack.imgInternet + imngUrl,
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.circular(10))),
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
                color: CategoryColorHandler.categorycolor[indexCat]
                    .withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                  color: CategoryColorHandler.categorycolor[indexCat]
                      .withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: 100,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    catName,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 10,
            child: InkWell(
              onTap: Edit,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: 40,
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(Icons.edit)),
                ),
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 10,
            child: Container(
              width: FilemonHelperFunctions.screenWidth() * 0.95,
              child: Text(
                nama,
                style: Theme.of(context).textTheme.headlineMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Container(
              width: 100,
              child: Text(
                status,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          )
        ]));
  }
}
