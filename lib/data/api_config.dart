import 'dart:developer';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/interface.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class APILogin {
  APILogin({required this.userCred, required this.userCredPw});
  final String userCred, userCredPw;
  final deviceStorage = GetStorage();

  final dio = Dio();

  requestLogin() async {
    final formData = FormData.fromMap({
      'username': userCred,
      'password': userCredPw,
    });

    try {
      Response response;
      response = await dio.post('${ConfigBack.apiAdress}/api/v1/token',
          data: formData);
      if (response.statusCode == 200) {
        String accessToken = response.data['access_token'];
        String accessTokenString = accessToken.toString();
        deviceStorage.write("usertoken", accessTokenString);
        deviceStorage.write('IsFirstTime', false);
        deviceStorage.write("useradmin", true);
        var cred = response.data['credential'];
        String credString = cred.toString();
        APIGetAdminInfo(userid: credString).get();
        deviceStorage.write("userC", credString);
        Future.delayed(const Duration(seconds: 1), () {
          FilemonHelperFunctions.showSnackBar("Hi,Kamu Berhasi Masuk");
          NavigationAdmin().toMainScreen();
        });
      } else {}
    } catch (e) {
      if (e is DioException) {
        return FilemonHelperFunctions.showSnackBar("Informasi Akun Salah");
      }
    }
  }
}

class APIGetAdminInfo {
  APIGetAdminInfo({this.userid});
  final String? userid;
  final dio = Dio();
  final deviceStorage = GetStorage();

  get() async {
    try {
      Response response;
      Options options = Options(headers: HeadersCode().data());
      response = await dio.get(
          '${ConfigBack.apiAdress}/api/v1/user/{user_id}?api_id=$userid',
          options: options);
      if (response.statusCode == 200) {
        deviceStorage.write("A_name", response.data['name'].toString());
        deviceStorage.write("A_pic", response.data['pic'].toString());
      } else {}
    } catch (e) {
      if (e is DioException) {
        print(e);
        return FilemonHelperFunctions.showSnackBar("Masalah Server Terjadi");
      }
    }
  }
}

class DioService {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    Options options = Options(headers: HeadersCode().data(), method: "GET");
    return await dio.get(url, options: options).then((response) {
      return response;
    });
  }
}
