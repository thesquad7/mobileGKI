import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/model/pendeta.dart';
import 'package:get/get.dart';

class PendetaController extends GetxController {
  RxList<PendetaJSON> jemaat = RxList();
  RxBool isLoading = true.obs;
  var url = "${ConfigBack.apiAdress}/admin/pendeta/";

  getPendeta() async {
    isLoading = true.obs;
    var response = await DioService().getMethod(url);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        jemaat.add(PendetaJSON.fromJson(element));
      });
      isLoading = false.obs;
    }
  }

  @override
  void onInit() {
    getPendeta();
    super.onInit();
  }
}
