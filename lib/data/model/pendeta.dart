class PendetaJSON {
  late final String status, name, pic, id;

  PendetaJSON(
      {required this.status,
      required this.name,
      required this.pic,
      required this.id});

  PendetaJSON.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    id = json['id'].toString();
    pic = json['profile_img'];
  }
}
