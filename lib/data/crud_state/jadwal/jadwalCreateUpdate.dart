import 'dart:developer';

import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/jadwal/jadwallisting.dart';
import 'package:MobileGKI/data/interface.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as Devices;
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

class APIJadwalCRUD {
  APIJadwalCRUD({
    this.name,
    this.id,
    this.file,
    this.content,
    this.tanggal,
    this.jam_acara,
    this.category_id,
    this.pendeta_id,
    this.gereja_id,
  });
  final String? name, id;
  final String? content, tanggal, jam_acara, file;
  int? category_id, pendeta_id, gereja_id;
  final JadwalController JController = Get.find();
  var url = "${ConfigBack.apiAdress}/admin/jadwal/";
  var urlNoImg = "${ConfigBack.apiAdress}/admin/jadwal_no_image/";
  final dio = Dio();

  requestCreate() async {
    await GetStorage.init();
    final deviceStorage = GetStorage();
    final formData = FormData.fromMap({
      'title': name,
      'content': content,
      'tanggal_mulai': tanggal,
      'waktu_mulai': jam_acara,
      'category_id': category_id,
      'pendeta_id': pendeta_id,
      'church_id': gereja_id,
      'file': await MultipartFile.fromFile(file!)
    });

    try {
      print(formData.fields);
      Response response;
      response = await await DioService().postMethod(url, formData);
      if (response.statusCode == 200) {
        deviceStorage.write("message", response.data['message']);
        deviceStorage.write("created", true);
      } else {}
    } on DioException catch (e) {
      if (e.response != null) {
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

  requestUpdate() async {
    await GetStorage.init();
    final deviceStorage = GetStorage();
    final formData = FormData.fromMap({
      'title': name.toString(),
      'content': content.toString(),
      'tanggal_mulai': tanggal.toString(),
      'waktu_mulai': jam_acara.toString(),
      'category_id': category_id,
      'pendeta_id': pendeta_id,
      'church_id': gereja_id,
      'file': await MultipartFile.fromFile(file!)
    });

    try {
      var response = await DioService().putMethod('$url$id', formData);
      if (response.statusCode == 200) {
        deviceStorage.write("created", true);
        deviceStorage.write("message", response.data['message']);
        Get.close(3);
        JController.remJadwal();
        JController.getJadwal();
        deviceStorage.remove("message");
        deviceStorage.write("created", false);
      }
    } on DioException catch (e) {
      if (e.response != null) {
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

  requestUpdateNoImage() async {
    await GetStorage.init();
    final deviceStorage = GetStorage();
    final formData = FormData.fromMap({
      'title': name,
      'content': content,
      'tanggal_mulai': tanggal,
      'waktu_mulai': jam_acara,
      'category_id': category_id,
      'pendeta_id': pendeta_id,
      'church_id': gereja_id,
    });

    try {
      var response = await DioService().putMethod('$urlNoImg$id', formData);
      if (response.statusCode == 200) {
        deviceStorage.write("created", true);
        deviceStorage.write("message", response.data['message']);
        Get.close(3);
        JController.remJadwal();
        JController.getJadwal();
        deviceStorage.remove("message");
        deviceStorage.write("created", false);
      }
    } on DioException catch (e) {
      if (e.response != null) {
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

  requestDelete() async {
    await GetStorage.init();
    final deviceStorage = GetStorage();

    try {
      var response = await DioService().deleteMethod('$url$id');
      if (response.statusCode == 200) {
        deviceStorage.write("message", response.data['message']);
        deviceStorage.write("created", true);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        switch (e.response!.statusCode) {
          case 401:
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
}
