import 'dart:developer';

import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/interface.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class APIAcaraCRUD {
  APIAcaraCRUD({
    this.name,
    this.id,
    this.status,
    this.file,
    this.content,
    this.location,
    this.tanggal,
    this.jam_acara,
    this.category_id,
  });
  final String? name, status, id;
  final String? content, location, tanggal, jam_acara, file;
  int? category_id;

  var url = "${ConfigBack.apiAdress}/admin/acara/";
  var urlNoImg = "${ConfigBack.apiAdress}/admin/acara_no_image/";
  final dio = Dio();

  requestCreate() async {
    await GetStorage.init();
    final deviceStorage = GetStorage();
    final formData = FormData.fromMap({
      'name': name,
      'status': status,
      'content': content,
      'location': location,
      'tanggal': tanggal,
      'jam_acara': jam_acara,
      'category_id': category_id,
      'file': await MultipartFile.fromFile(file!)
    });

    try {
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
      'name': 'Pdt. $name',
      'status': status,
      'file': await MultipartFile.fromFile(file!)
    });

    try {
      var response = await DioService().putMethod('$url$id', formData);
      if (response.statusCode == 200) {
        deviceStorage.write("message", response.data['message']);
        deviceStorage.write("created", true);
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
      'name': 'Pdt. $name',
      'status': status,
    });

    try {
      var response = await DioService().putMethod('$urlNoImg$id', formData);
      if (response.statusCode == 200) {
        deviceStorage.write("message", response.data['message']);
        deviceStorage.write("created", true);
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
