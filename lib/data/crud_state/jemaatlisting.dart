import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/model/jemaat.dart';
import 'package:get/get.dart';

class JemaatController extends GetxController {
  RxList<JemaatJSON> jemaat = RxList();

  var url = "${ConfigBack.apiAdress}/admin/jemaat/";

  getJemaat() async {
    var response = await DioService().getMethod(url);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        jemaat.add(JemaatJSON.fromJson(element));
      });
    }
  }

  @override
  void onInit() {
    getJemaat();
    super.onInit();
  }
}
