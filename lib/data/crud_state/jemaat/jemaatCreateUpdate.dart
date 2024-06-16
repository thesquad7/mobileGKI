import 'dart:developer';

import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/interface.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class APIJemaatCRUD {
  APIJemaatCRUD(
      {this.dateborn,
      this.id,
      this.baptis,
      this.pendetaId,
      this.n_mother,
      this.n_father,
      this.n_babtism,
      this.placeborn,
      this.address,
      this.name,
      this.file,
      this.jemaatId});
  final String? name, n_mother, n_father, n_babtism;
  final String? jemaatId, id, pendetaId, file, placeborn, address, dateborn;
  final bool? baptis;

  var url = "${ConfigBack.apiAdress}/admin/jemaat/";
  var urlnew2 = "${ConfigBack.apiAdress}/admin/jemaatNoBaptis/";
  var url2 = "${ConfigBack.apiAdress}/admin/jemaat_nopic/";
  var urlNoImg = "${ConfigBack.apiAdress}/admin/jemaat/";
  final dio = Dio();

  requestCreateNobaptis() async {
    final String baptisString = (baptis ?? false).toString();
    await GetStorage.init();
    final deviceStorage = GetStorage();

    final formData = FormData.fromMap({
      'jemaat_id': jemaatId,
      'name': name,
      'baptis': baptis,
      'tempat_lahir': placeborn,
      'tanggal_lahir': dateborn,
      'n_bapak': n_father,
      'n_ibu': n_mother,
      'alamat': address,
      'file': await MultipartFile.fromFile(file!)
    });
    log('jemaat_id :' + jemaatId.toString());
    log('name :' + name.toString());
    log('baptis :' + baptisString);
    log('tempat_lahir :' + placeborn.toString());
    log('tanggal_lahir :' + dateborn.toString());
    log('n_bapak :' + n_father.toString());
    log('n_ibu :' + n_mother.toString());
    log('alamat :' + address.toString());
    log('file :' + file.toString());
    try {
      Response response;
      response = await await DioService().postMethod(urlnew2, formData);
      if (response.statusCode == 200) {
        deviceStorage.write("message", response.data['message']);
        deviceStorage.write("created", true);
      } else {}
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

  requestCreate() async {
    final String baptisString = (baptis ?? false).toString();
    await GetStorage.init();
    final deviceStorage = GetStorage();
    final formData = FormData.fromMap({
      'pendeta_id': pendetaId,
      'jemaat_id': jemaatId,
      'name': name,
      'baptis': baptisString,
      'tempat_lahir': placeborn,
      'tanggal_lahir': dateborn,
      'n_bapak': n_father,
      'n_ibu': n_mother,
      'n_baptis': n_babtism,
      'alamat': address,
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
    final String baptisString = (baptis ?? false).toString();
    final deviceStorage = GetStorage();
    final formData = FormData.fromMap({
      'pendeta_id': pendetaId,
      'jemaat_id': jemaatId,
      'name': name,
      'baptis': baptisString,
      'tempat_lahir': placeborn,
      'tanggal_lahir': dateborn,
      'n_bapak': n_father,
      'n_ibu': n_mother,
      'n_baptis': n_babtism,
      'alamat': address,
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
            FilemonHelperFunctions.showSnackBar(
                "Koneksi bermasalah, ini bukan pada perangkat anda");
            break;
        }
      }
    }
  }

  requestUpdateSameIMG() async {
    final String baptisString = (baptis ?? false).toString();
    await GetStorage.init();
    final deviceStorage = GetStorage();
    final formData = FormData.fromMap({
      'pendeta_id': pendetaId,
      'jemaat_id': jemaatId,
      'name': name,
      'baptis': baptis,
      'tempat_lahir': placeborn,
      'tanggal_lahir': dateborn,
      'n_bapak': n_father,
      'n_ibu': n_mother,
      'n_baptis': n_babtism,
      'alamat': address,
    });

    log(baptis.toString());

    try {
      var response = await DioService().putMethod('$url2$id', formData);
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
    } catch (e) {
      if (e is DioException) {
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
            FilemonHelperFunctions.showSnackBar(
                "Koneksi bermasalah, ini bukan pada perangkat anda");
            break;
        }
      }
    }
  }
}
