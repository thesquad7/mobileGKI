// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:developer';

import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/acara/acaralisting.dart';
import 'package:MobileGKI/data/interface.dart';
import 'package:MobileGKI/home/nested/adminarea_child/acara_menu/crud_aama_acara.dart';
import 'package:MobileGKI/home/nested/adminarea_child/jadwal_menu/crud_aaj_jadwal.dart';
import 'package:MobileGKI/home/nested/adminarea_child/renungan_menu/crud_aama_acara.dart';
import 'package:MobileGKI/provider/adminProvider/acaraProvier.dart';
import 'package:MobileGKI/provider/adminProvider/jadwalProvider.dart';
import 'package:MobileGKI/provider/adminProvider/kesaksianProvider.dart';
import 'package:MobileGKI/provider/adminProvider/renunganProvider.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

import '../../../home/nested/adminarea_child/kesaksian_menu/crud_aamk_kesaksian.dart';

class APIGetRenunganInfo {
  APIGetRenunganInfo({this.acaraId});
  final String? acaraId;
  final dio = Dio();
  final deviceStorage = GetStorage();
  final RenunganProvider infoRenungan = Get.put(RenunganProvider());

  var url = "${ConfigBack.apiAdress}/admin/renungan/";

  getRenungan() async {
    try {
      var response = await DioService().getMethod('$url$acaraId');
      if (response.statusCode == 200) {
        infoRenungan.setValue(infoRenungan.id, response.data['id'].toString());
        infoRenungan.setValue(infoRenungan.name, response.data['name']);
        infoRenungan.setValue(infoRenungan.tanggal, response.data['tanggal']);
        infoRenungan.setValue(infoRenungan.file, response.data['content_img']);
        infoRenungan.setValue(infoRenungan.content, response.data['content']);
        infoRenungan.setValue(infoRenungan.category_id,
            response.data['category']['id'].toString());

        Get.to(() => EditRenungan(
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
