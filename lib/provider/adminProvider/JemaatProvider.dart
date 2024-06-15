// ignore_for_file: file_names, non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:get/get.dart';

class JemaatProvider extends GetxController {
  var name = "".obs;
  var id = "".obs;
  var baptis = false.obs;
  var pdt_id = 0.obs;
  var dateborn = "".obs;
  var placeborn = "".obs;
  var n_baptis = "".obs;
  var n_father = "".obs;
  var n_mother = "".obs;
  var address = "".obs;
  var file = "".obs;
  var j_id = "".obs;

  void clearData() {
    pdt_id.value = 0;
  }

  @override
  void onInit() {
    super.onInit();
  }

  void setBaptisState(bool _baptis) {
    baptis.value = _baptis;
  }

  void setName(String _name) {
    name.value = _name;
  }

  void setId(String _id) {
    id.value = _id;
  }

  void setDateborn(String _dateborn) {
    dateborn.value = _dateborn;
  }

  void setPlaceBorn(String _placeborn) {
    placeborn.value = _placeborn;
  }

  void setNFather(String _n_father) {
    n_father.value = _n_father;
  }

  void setNMother(String _n_mother) {
    n_mother.value = _n_mother;
  }

  void setNBaptism(String _n_babtism) {
    n_baptis.value = _n_babtism;
  }

  void setAddress(String _address) {
    address.value = _address;
  }

  void setJiD(String _j_id) {
    j_id.value = _j_id;
  }

  void setPdtId(int _p_id) {
    pdt_id.value = _p_id;
  }

  void setFile(String _file) {
    file.value = _file;
  }
}
