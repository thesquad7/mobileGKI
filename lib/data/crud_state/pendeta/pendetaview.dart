import 'dart:developer';

import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/home/nested/adminarea_child/edit/crud_pendeta.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

class APIGetPendetaInfo {
  APIGetPendetaInfo({this.pendetaId});
  final String? pendetaId;
  final dio = Dio();
  final deviceStorage = GetStorage();

  var url = "${ConfigBack.apiAdress}/admin/pendeta/";

  getPendeta() async {
    try {
      var response = await DioService().getMethod('$url$pendetaId');
      if (response.statusCode == 200) {
        deviceStorage.write("P_name", response.data['name'].toString());
        deviceStorage.write("P_pic", response.data['profile_img'].toString());
        deviceStorage.write("P_status", response.data['status'].toString());
        log(response.data);
      }
    } catch (e) {
      if (e is DioException) {
        print(e);
        return FilemonHelperFunctions.showSnackBar("Masalah Server Terjadi");
      }
    }
  }
}
