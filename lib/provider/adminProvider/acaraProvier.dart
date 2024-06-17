import 'package:get/get.dart';

class AcaraProvider extends GetxController {
  var name = "".obs;
  var id = "".obs;
  var status = "".obs;
  var location = "".obs;
  var tanggal = "".obs;
  var jam_mulai = "".obs;
  var category_id = "".obs;
  var content = "".obs;
  var file = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setValue<T>(Rx<T> variable, T value) {
    variable.value = value;
  }
}
