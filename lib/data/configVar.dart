import 'package:get_storage/get_storage.dart';

class ConfigBack {
  ConfigBack._();
  static final addressVPS = "http://103.181.183.56";
  static final localhost = "http://10.0.2.2:8000";

  static final apiAdress = localhost;
  static final imgInternet = "/?path_p=";
}

class HeadersCode {
  final deviceStorage = GetStorage();
  data() {
    Map<String, dynamic> headers = {
      'Authorization': 'Bearer ${deviceStorage.read("usertoken")}',
      'Content-Type': 'application/json',
      // Add more headers if needed
    };
    return headers;
  }
}
