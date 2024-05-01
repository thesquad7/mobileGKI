import 'dart:developer';
import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/pendeta/pendetalisting.dart';
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

class Pendeta extends StatelessWidget {
  Pendeta({
    Key? key,
  }) : super(key: key);

  final PendetaController PController = Get.put(PendetaController());

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
            Get.to(() => EditPendeta());
          }),
      body: Obx(
        () => SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: PController.isInternetConnect.value
              ? PController.isLoading.value
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
      color: Colors.redAccent,
      showChildOpacityTransition: true,
      onRefresh: () {
        return PController.getPendeta();
      },
      child: ScrollablePositionedList.builder(
          itemScrollController: PController.itemController,
          physics: const BouncingScrollPhysics(),
          itemCount: PController.pendeta.length,
          itemBuilder: (_, index) {
            return PendetaItem(
                nama: PController.pendeta[index].name,
                status: PController.pendeta[index].status,
                imngUrl: PController.pendeta[index].pic,
                Edit: () {});
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
      title: Text("Pendeta"),
    );
  }

  void _materialOnTapButton(BuildContext context) async {
    if (await InternetConnectionChecker().hasConnection == true) {
      PController.getPendeta();
    } else {
      FilemonHelperFunctions.showSnackBar(context.toString());
    }
  }
}

class PendetaItem extends StatelessWidget {
  const PendetaItem({
    super.key,
    required this.nama,
    required this.status,
    required this.imngUrl,
    required this.Edit,
  });
  final String nama, status, imngUrl;
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
                isNetworkImage: true,
                imageUrl:
                    ConfigBack.apiAdress + ConfigBack.imgInternet + imngUrl,
                height: 80,
              ),
              Container(
                width: 200,
                height: 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nama,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      status,
                      style: Theme.of(context).textTheme.labelLarge,
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
