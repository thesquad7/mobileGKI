import 'dart:developer';
import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/gereja/gerejalisting.dart';
import 'package:MobileGKI/data/crud_state/gereja/gerejaview.dart';
import 'package:MobileGKI/data/crud_state/pendeta/pendetaview.dart';
import 'package:MobileGKI/home/nested/adminarea_child/edit/crud_pendeta.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../../utils/constrains/colors.dart';
import '../edit/crud_aap_t_ibadah.dart';

class TempatIbadah extends StatelessWidget {
  TempatIbadah({
    Key? key,
  }) : super(key: key);

  final GerejaController GController = Get.put(GerejaController());

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
            GetStorage().write("pagetitle", "Tambah Tempat Ibadah");
            Get.to(() => EditTempatIbdah());
          }),
      body: Obx(
        () => SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: GController.isInternetConnect.value
              ? GController.isLoading.value
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
              "Terjadi Masalah, Coba Kembali",
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
        GController.remGereja();
        return GController.getGereja();
      },
      child: ScrollablePositionedList.builder(
          itemScrollController: GController.itemController,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: GController.gereja.length,
          itemBuilder: (_, index) {
            return PendetaItem(
                nama: GController.gereja[index].name,
                imngUrl: GController.gereja[index].pic,
                Edit: () async {
                  GetStorage().write("data", true);
                  GetStorage()
                      .write("pagetitle", "Perbaharui data Tempat Ibadah");
                  await APIGetGerejaInfo(
                          pendetaId: GController.gereja[index].id.toString())
                      .getTempatIbadah();
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
      title: Text("Tempat Ibadah"),
    );
  }

  void _materialOnTapButton(BuildContext context) async {
    if (await InternetConnectionChecker().hasConnection == true) {
      GController.getGereja();
    } else {
      FilemonHelperFunctions.showSnackBar(context.toString());
    }
  }
}

class PendetaItem extends StatelessWidget {
  const PendetaItem({
    super.key,
    required this.nama,
    required this.imngUrl,
    required this.Edit,
  });
  final String nama, imngUrl;
  final VoidCallback Edit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(),
        height: 100,
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RoundedIMG(
                width: 80,
                isNetworkImage: true,
                imageUrl:
                    ConfigBack.apiAdress + ConfigBack.imgInternet + imngUrl,
                height: 80,
              ),
              Container(
                width: 200,
                height: 75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nama,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              Container(
                width: 40,
                child: IconButton(
                  onPressed: Edit,
                  icon: Icon(Icons.edit),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
