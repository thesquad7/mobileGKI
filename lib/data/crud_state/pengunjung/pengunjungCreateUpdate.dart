import 'dart:developer';

import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/interface.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class APIPengunjungCRUD {
  APIPengunjungCRUD(
      {this.id,
      this.stream,
      this.w_jemaat,
      this.p_jemaat,
      this.w_visit,
      this.p_visit,
      this.stream_count,
      this.jadwal_id});
  final bool? stream;
  int? id;
  final int? jadwal_id, w_jemaat, p_jemaat, w_visit, p_visit, stream_count;

  var url = "${ConfigBack.apiAdress}/admin/visitor/";
  final dio = Dio();

  requestCreate() async {
    await GetStorage.init();
    final deviceStorage = GetStorage();

    try {
      Response response;

      response = await DioService().postMethod(url, {
        'jadwal_id': jadwal_id,
        'w_jemaat': w_jemaat,
        'p_jemaat': w_jemaat,
        'p_visit': p_visit,
        'w_visit': w_visit,
        'stream': stream,
        'stream_count': stream_count,
      });
      if (response.statusCode == 200) {
        log("im here");
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

    try {
      var response = await DioService().putMethod('$url$id', {
        'w_jemaat': w_jemaat,
        'p_jemaat': w_jemaat,
        'p_visit': p_visit,
        'w_visit': w_visit,
        'stream': stream,
        'stream_count': stream_count,
      });
      if (response.statusCode == 200) {
        log('done');
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
