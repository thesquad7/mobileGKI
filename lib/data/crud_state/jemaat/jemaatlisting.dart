import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/interface.dart';
import 'package:MobileGKI/data/model/jemaat.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class JemaatController extends GetxController {
  RxList<JemaatJSON> jemaat = RxList();
  RxBool isListViewScrollToTheDown = false.obs;
  RxBool isLoading = true.obs;
  RxBool isInternetConnect = true.obs;
  final deviceStorage = GetStorage();
  var url = "${ConfigBack.apiAdress}/admin/jemaat/";
  var itemController = ItemScrollController();

  isInternatConnect() async {
    isInternetConnect.value = await InternetConnectionChecker().hasConnection;
  }

  getJemaat() async {
    var response = await DioService().getMethod(url);
    isInternatConnect();
    isLoading.value = true;
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        jemaat.add(JemaatJSON.fromJson(element));
      });
    } else if (response.statusCode == 401) {
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(), // Show a loading indicator
            SizedBox(height: 16),
            Text('Sesi login telah habis, kembali kehalaman Login'),
          ],
        ),
      );
      deviceStorage.write('user_login', false);
      deviceStorage.write('IsFirstTime', false);
      print(deviceStorage.read('user_login'));
      print(deviceStorage.read('IsFirstTime'));
      deviceStorage.remove('usertoken');
      deviceStorage.remove('userC');
      NavigationAdmin().toMain();
    }
    Future.delayed(const Duration(seconds: 1), () {
      isLoading.value = false;
    });
  }

  remJemaat() async {
    jemaat.clear();
  }

  scrollListViewDownward() {
    itemController.scrollTo(
        index: jemaat.length - 4,
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
    getJemaat();
    isInternatConnect();
    super.onInit();
  }
}
