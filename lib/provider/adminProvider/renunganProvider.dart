import 'package:get/get.dart';

class RenunganProvider extends GetxController {
  var id = "".obs;
  var name = "".obs;
  var tanggal = "".obs;
  var content = "".obs;
  var category_id = "".obs;
  var file = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setValue<T>(Rx<T> variable, T value) {
    variable.value = value;
  }
}
