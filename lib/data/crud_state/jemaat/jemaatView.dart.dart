import 'dart:developer';

import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/home/nested/adminarea_child/edit/crud_aa_jemaat.dart';
import 'package:MobileGKI/home/nested/adminarea_child/edit/crud_pendeta.dart';
import 'package:MobileGKI/provider/adminProvider/JemaatProvider.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

class APIGetJemaatInfo {
  APIGetJemaatInfo({this.jemaatId});
  final String? jemaatId;
  final dio = Dio();
  final deviceStorage = GetStorage();
  var url = "${ConfigBack.apiAdress}/admin/jemaat/";

  getJemaat() async {
    try {
      var response = await DioService().getMethod('$url$jemaatId');
      if (response.statusCode == 200) {
        final JemaatProvider infoJemaat = Get.put(JemaatProvider());
        infoJemaat.setInfo(
            response.data['name'].toString(),
            response.data['id'].toString(),
            response.data['tanggal_lahir'].toString(),
            response.data['tempat_lahir'].toString(),
            response.data['nama_baptis'].toString(),
            response.data['nama_bapak'].toString(),
            response.data['nama_ibu'].toString(),
            response.data['alamat'].toString(),
            response.data['jemaat_img'].toString(),
            response.data['pendeta_id'].toString(),
            response.data['jemaat_id'].toString());
        Get.to(() => EditJemaat(
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
