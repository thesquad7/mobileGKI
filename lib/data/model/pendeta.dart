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

class PendetaJSONForEntity {
  final String id;
  final String name;

  PendetaJSONForEntity({required this.id, required this.name});

  factory PendetaJSONForEntity.fromJson(Map<String, dynamic> json) {
    return PendetaJSONForEntity(
      id: json['id'].toString(),
      name: json['name'],
    );
  }
}
