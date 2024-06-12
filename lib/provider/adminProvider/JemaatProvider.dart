import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class JemaatProvider extends GetxController {
  var name = "".obs;
  var id = "".obs;
  var baptis = false.obs;
  var pdt_id = "".obs;
  var dateborn = "".obs;
  var placeborn = "".obs;
  var n_baptis = "".obs;
  var n_father = "".obs;
  var n_mother = "".obs;
  var address = "".obs;
  var file = "".obs;
  var j_id = "".obs;
  var p_id = "".obs;

  void setInfo(
      String _name,
      String _id,
      String _dateborn,
      String _placeborn,
      String _n_babtis,
      String _n_father,
      String _n_mother,
      String _address,
      String _file,
      String _p_id,
      bool _baptis,
      String _pdt_id,
      String _j_id) {
    name.value = _name;
    id.value = _id;
    dateborn.value = _dateborn;
    placeborn.value = _placeborn;
    n_baptis.value = _n_babtis;
    n_father.value = _n_father;
    n_mother.value = _n_mother;
    address.value = _address;
    file.value = _file;
    j_id.value = _j_id;
    p_id.value = _p_id;
    baptis.value = _baptis;
    pdt_id.value = _pdt_id;
  }
}
