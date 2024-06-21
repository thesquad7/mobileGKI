// ignore_for_file: unused_import

import 'dart:developer';

import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/interface.dart';
import 'package:MobileGKI/home/nested/adminarea_child/edit/crud_aap_jemaat.dart';
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
  final JemaatProvider infoJemaat = Get.put(JemaatProvider());
  var url = "${ConfigBack.apiAdress}/admin/jemaat/";

  getJemaat() async {
    try {
      infoJemaat.setPdtId(0);
      var response = await DioService().getMethod('$url$jemaatId');
      if (response.statusCode == 200) {
        infoJemaat.setName(response.data['name'].toString());
        infoJemaat.setId(response.data['id'].toString());
        infoJemaat.setDateborn(response.data['tanggal_lahir'].toString());
        infoJemaat.setPlaceBorn(response.data['tempat_lahir'].toString());
        infoJemaat.setNFather(response.data['nama_bapak'].toString());
        infoJemaat.setNMother(response.data['nama_ibu'].toString());
        infoJemaat.setAddress(response.data['alamat'].toString());
        infoJemaat.setFile(response.data['jemaat_img'].toString());
        if (response.data['pendeta_id'] != null &&
            response.data['nama_baptis'] != null) {
          infoJemaat.setPdtId(response.data['pendeta_id']);
          infoJemaat.setNBaptism(response.data['nama_baptis'].toString());
        }
        infoJemaat.setBaptisState(response.data['baptis']);
        infoJemaat.setJiD(response.data['jemaat_id'].toString());
        Get.to(() => EditJemaat(
              isNImg: true,
            ));
        log(infoJemaat.pdt_id.value.toString());
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
