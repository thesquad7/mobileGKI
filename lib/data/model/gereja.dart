class GerejaJSON {
  late final String name, pic, id;

  GerejaJSON({required this.name, required this.pic, required this.id});

  GerejaJSON.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'].toString();
    pic = json['content_img'];
  }
}

class GerejaJSONForEntity {
  final int id;
  final String name;

  GerejaJSONForEntity({required this.id, required this.name});

  factory GerejaJSONForEntity.fromJson(Map<String, dynamic> json) {
    return GerejaJSONForEntity(
      id: json['id'],
      name: json['name'],
    );
  }
}
