import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/model/pendeta.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PendetaController extends GetxController {
  RxList<PendetaJSON> pendeta = RxList();
  RxBool isListViewScrollToTheDown = false.obs;
  RxBool isLoading = true.obs;
  RxBool isInternetConnect = true.obs;
  var url = "${ConfigBack.apiAdress}/admin/pendeta/";
  var itemController = ItemScrollController();

  isInternatConnect() async {
    isInternetConnect.value = await InternetConnectionChecker().hasConnection;
  }

  getPendeta() async {
    var response = await DioService().getMethod(url);
    isLoading.value = true;
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        pendeta.add(PendetaJSON.fromJson(element));
      });
      isLoading = false.obs;
    }
  }

  scrollListViewDownward() {
    itemController.scrollTo(
        index: pendeta.length - 4,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn);
    isListViewScrollToTheDown.value = true;
  }

  /// Scroll ListView To Up
  scrollListViewUpward() {
    itemController.scrollTo(
        index: 0,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn);
    isListViewScrollToTheDown.value = false;
  }

  @override
  void onInit() {
    getPendeta();
    isInternatConnect();
    super.onInit();
  }
}
