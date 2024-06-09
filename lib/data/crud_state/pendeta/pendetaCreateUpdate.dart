import 'dart:developer';

import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class APIPendetaCRUD {
  APIPendetaCRUD({this.name, this.status, this.file, this.pendetaId});
  final String? name, status;
  final String? pendetaId, file;

  var url = "${ConfigBack.apiAdress}/admin/pendeta/";
  var urlNoImg = "${ConfigBack.apiAdress}/admin/pendeta_no_img/";
  final dio = Dio();

  requestCreate() async {
    await GetStorage.init();
    final deviceStorage = GetStorage();
    final formData = FormData.fromMap({
      'name': 'Pdt. $name',
      'status': status,
      'file': await MultipartFile.fromFile(file!)
    });

    try {
      Response response;
      response = await await DioService().postMethod(url, formData);
      if (response.statusCode == 200) {
        deviceStorage.write("message", response.data['message']);
        deviceStorage.write("created", true);
      } else {}
    } catch (e) {
      if (e is DioException) {
        return FilemonHelperFunctions.showSnackBar("Terjadi Masalah System");
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
      var response = await DioService().putMethod('$url$pendetaId', formData);
      if (response.statusCode == 200) {
        deviceStorage.write("message", response.data['message']);
        deviceStorage.write("created", true);
      }
    } catch (e) {
      if (e is DioException) {
        print(e);
        return FilemonHelperFunctions.showSnackBar("Masalah Server Terjadi");
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
      var response =
          await DioService().putMethod('$urlNoImg$pendetaId', formData);
      if (response.statusCode == 200) {
        deviceStorage.write("message", response.data['message']);
        deviceStorage.write("created", true);
      }
    } catch (e) {
      if (e is DioException) {
        print(e);
        return FilemonHelperFunctions.showSnackBar("Masalah Server Terjadi");
      }
    }
  }

  requestDelete() async {
    await GetStorage.init();
    final deviceStorage = GetStorage();

    try {
      var response = await DioService().deleteMethod('$url$pendetaId');
      if (response.statusCode == 200) {
        deviceStorage.write("message", response.data['message']);
        deviceStorage.write("created", true);
      }
    } catch (e) {
      if (e is DioException) {
        print(e);
        return FilemonHelperFunctions.showSnackBar("Masalah Server Terjadi");
      }
    }
  }
}
