// ignore_for_file: unused_import

import 'dart:developer';

import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/acara/acaralisting.dart';
import 'package:MobileGKI/data/interface.dart';
import 'package:MobileGKI/home/nested/adminarea_child/acara_menu/crud_aama_acara.dart';
import 'package:MobileGKI/home/nested/adminarea_child/jadwal_menu/crud_aaj_jadwal.dart';
import 'package:MobileGKI/provider/adminProvider/acaraProvier.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

class APIGetJadwalView {
  APIGetJadwalView({this.acaraId});
  final String? acaraId;
  final dio = Dio();
  final deviceStorage = GetStorage();
  final AcaraProvider infoAcara = Get.put(AcaraProvider());

  var url = "${ConfigBack.apiAdress}/admin/jadwal/";

  getJadwal() async {
    try {
      var response = await DioService().getMethod('$url$acaraId');
      if (response.statusCode == 200) {
        infoAcara.setValue(infoAcara.id, response.data['id'].toString());
        infoAcara.setValue(infoAcara.name, response.data['name'].toString());
        infoAcara.setValue(
            infoAcara.file, response.data['content_img'].toString());
        infoAcara.setValue(
            infoAcara.category_id, response.data['category_id'].toString());
        print(infoAcara.category_id.value);
        infoAcara.setValue(
            infoAcara.content, response.data['content'].toString());
        infoAcara.setValue(
            infoAcara.jam_mulai, response.data['jam_mulai'].toString());
        infoAcara.setValue(
            infoAcara.tanggal, response.data['tanggal'].toString());
        infoAcara.setValue(
            infoAcara.status, response.data['status'].toString());
        infoAcara.setValue(
            infoAcara.location, response.data['location'].toString());
        Get.to(() => EditJadwal(
              isNImg: true,
            ));
      }
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.badResponse) {
          FilemonHelperFunctions.showSnackBar(
              "Waktu sesi telah berakhir silahkan Re-Log");
          deviceStorage.write('user_login', false);
          deviceStorage.write('IsFirstTime', false);
          print(deviceStorage.read('user_login'));
          print(deviceStorage.read('IsFirstTime'));
          deviceStorage.remove('usertoken');
          deviceStorage.remove('userC');
          NavigationAdmin().toMain();
        }
      }
    }
  }
}
