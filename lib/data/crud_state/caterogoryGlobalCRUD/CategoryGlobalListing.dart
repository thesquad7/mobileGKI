import 'dart:developer';

import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/interface.dart';
import 'package:MobileGKI/data/model/category.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CategoryPersonaController extends GetxController {
  RxList<CategoryJSON> cat = RxList();
  RxBool isListViewScrollToTheDown = false.obs;
  RxBool isLoading = true.obs;
  RxBool isInternetConnect = true.obs;
  final deviceStorage = GetStorage();
  var url = "${ConfigBack.apiAdress}/admin/category_use_id/";
  var itemController = ItemScrollController();

  getCategory() async {
    isLoading.value = true;

    try {
      var use_id = GetStorage().read("CategoryPlace");
      var response = await DioService().getMethod(url + use_id);
      if (response.statusCode == 200) {
        response.data.forEach((element) {
          cat.add(CategoryJSON.fromJson(element));
        });
      }
      Future.delayed(const Duration(seconds: 1), () {
        isLoading.value = false;
      });
    } catch (e) {
      isLoading.value = false;
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          FilemonHelperFunctions.showSnackBar(
              "Waktu sesi telah berakhir silahkan Re-Log");
          deviceStorage.write('user_login', false);
          deviceStorage.write('IsFirstTime', false);
          print(deviceStorage.read('user_login'));
          print(deviceStorage.read('IsFirstTime'));
          deviceStorage.remove('usertoken');
          deviceStorage.remove('userC');
          NavigationAdmin().toMain();
          if (e.type == DioExceptionType.connectionError) {
            FilemonHelperFunctions.showSnackBar(
                "Koneksi bermasalah, ini bukan pada perangkat anda");
          }
        }
      }
    }
  }

  remCategory() async {
    cat.clear();
  }

  scrollListViewDownward() {
    itemController.scrollTo(
        index: cat.length - 4,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn);
    isListViewScrollToTheDown.value = true;
  }

  scrollListViewUpward() {
    itemController.scrollTo(
        index: 0,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn);
    isListViewScrollToTheDown.value = false;
  }

  @override
  void onInit() {
    getCategory();
    super.onInit();
  }
}
