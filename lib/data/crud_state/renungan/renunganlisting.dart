import 'dart:developer';

import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/interface.dart';
import 'package:MobileGKI/data/model/renungan.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class RenunganController extends GetxController {
  RxList<RenunganJSON> renungan = RxList();
  RxBool isListViewScrollToTheDown = false.obs;
  RxBool isLoading = true.obs;
  RxBool isInternetConnect = true.obs;
  final deviceStorage = GetStorage();
  var url = "${ConfigBack.apiAdress}/admin/renungan/";
  var itemController = ItemScrollController();

  @override
  void onInit() {
    getData();
    isInternatConnect();
    super.onInit();
  }

  isInternatConnect() async {
    isInternetConnect.value = await InternetConnectionChecker().hasConnection;
  }

  getData() async {
    isInternatConnect();
    isLoading.value = true;
    try {
      var response = await DioService().getMethod(url);
      if (response.statusCode == 200) {
        response.data.forEach((element) {
          renungan.add(RenunganJSON.fromJson(element));
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
    } on DioException catch (e) {
      switch (e.response!.statusCode) {
        case 401:
          log(e.toString());
          FilemonHelperFunctions.showSnackBar(
              "Waktu sesi telah berakhir silahkan Re-Log");
          deviceStorage.write('user_login', false);
          deviceStorage.write('IsFirstTime', false);
          print(deviceStorage.read('user_login'));
          print(deviceStorage.read('IsFirstTime'));
          deviceStorage.remove('usertoken');
          deviceStorage.remove('userC');
          NavigationAdmin().toMain();
          break;
        case 500:
          log(e.toString());
          FilemonHelperFunctions.showSnackBar(
              "Koneksi bermasalah, ini bukan pada perangkat anda");
          break;
      }
    }
  }

  remData() async {
    renungan.clear();
  }

  scrollListViewDownward() {
    itemController.scrollTo(
        index: renungan.length - 4,
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
}

class RenunganEntity extends GetxController {
  var items = <RenunganJSONForEntity>[].obs;
  var selectedItem = Rxn<RenunganJSONForEntity>();
  var url = "${ConfigBack.apiAdress}/admin/category_use_id/3";
  final deviceStorage = GetStorage();
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    try {
      var response = await DioService().getMethod(url);
      if (response.statusCode == 200) {
        var jsonResponse = response.data as List;
        items.value = jsonResponse
            .map((item) => RenunganJSONForEntity.fromJson(item))
            .toList();
      }
    } catch (e) {
      if (e is DioException) {
        switch (e.response!.statusCode) {
          case 401:
            log(e.toString());
            FilemonHelperFunctions.showSnackBar(
                "Waktu sesi telah berakhir silahkan Re-Log");
            deviceStorage.write('user_login', false);
            deviceStorage.write('IsFirstTime', false);
            print(deviceStorage.read('user_login'));
            print(deviceStorage.read('IsFirstTime'));
            deviceStorage.remove('usertoken');
            deviceStorage.remove('userC');
            NavigationAdmin().toMain();
            break;
          case 500:
            log(e.toString());
            FilemonHelperFunctions.showSnackBar(
                "Koneksi bermasalah, ini bukan pada perangkat anda");
            break;
        }
      }
    }
  }

  void setDefaultSelectedItem(int relatedId) {
    var item = items.firstWhere((item) => item.id == relatedId,
        orElse: () => items.first);
    selectedItem.value = item;
  }

  void setSelectedItem(RenunganJSONForEntity? item) {
    selectedItem.value = item;
  }
}
