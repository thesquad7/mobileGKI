import 'dart:developer';
import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/home/nested/adminarea_child/edit/crud_aap_t_ibadah.dart';
import 'package:MobileGKI/provider/adminProvider/gerejaProvider.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class APIGetGerejaInfo {
  APIGetGerejaInfo({this.pendetaId});
  final String? pendetaId;
  final dio = Dio();
  final GerejaProvider infogereja = Get.put(GerejaProvider());

  var url = "${ConfigBack.apiAdress}/admin/gereja/";

  getTempatIbadah() async {
    try {
      var response = await DioService().getMethod('$url$pendetaId');
      if (response.statusCode == 200) {
        log(response.data.toString());
        infogereja.setValue(infogereja.name, response.data['name']);
        infogereja.setValue(infogereja.file, response.data['content_img']);
        infogereja.setValue(infogereja.id, response.data['id'].toString());
        Get.to(() => EditTempatIbdah(
              isNImg: true,
            ));
      }
    } catch (e) {
      if (e is DioException) {
        print(e);
        return FilemonHelperFunctions.showSnackBar("Masalah Server Terjadi");
      }
    }
  }
}
