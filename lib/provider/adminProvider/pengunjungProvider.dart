import 'package:get/get.dart';

class PengungjungProvider extends GetxController {
  var id = 0.obs;
  var w_jemaat = 0.obs;
  var p_jemaat = 0.obs;
  var w_visit = 0.obs;
  var p_visit = 0.obs;
  var stream_count = 0.obs;
  var stream = true.obs;
  var j_id = 0.obs;
  var j_name = "".obs;
  var j_date = "".obs;
  var j_type = "".obs;
  var j_pendeta = "".obs;
  var j_file = "".obs;
  var j_bg = "".obs;
  var j_place = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setValue<T>(Rx<T> variable, T value) {
    variable.value = value;
  }
}
