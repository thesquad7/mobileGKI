import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/model/pendeta.dart';
import 'package:get/get.dart';

class PendetaController extends GetxController {
  RxList<PendetaJSON> jemaat = RxList();

  var url = "${ConfigBack.apiAdress}/admin/pendeta/";

  getPendeta() async {
    var response = await DioService().getMethod(url);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        jemaat.add(PendetaJSON.fromJson(element));
      });
    }
  }

  @override
  void onInit() {
    getPendeta();
    super.onInit();
  }
}
