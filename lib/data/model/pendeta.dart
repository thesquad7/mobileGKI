class PendetaJSON {
  late final String nama, status, name, pic;

  PendetaJSON({required this.status, required this.name, required this.pic});

  PendetaJSON.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    pic = json['profile_img'];
  }
}
