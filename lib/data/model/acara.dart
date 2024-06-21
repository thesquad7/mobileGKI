// ignore_for_file: non_constant_identifier_names

class AcaraJSON {
  late final String status, name, pic, id, content, category_id, category_name;
  int? color_id;
  AcaraJSON(
      {required this.status,
      required this.name,
      required this.pic,
      required this.content,
      required this.category_id,
      required this.id});

  AcaraJSON.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    content = json['content'];
    id = json['id'].toString();
    category_id = json['category']['id'].toString();
    category_name = json['category']['name'].toString();
    color_id = int.parse(json['category']['color_id']);
    pic = json['content_img'];
  }
}

class AcaraJSONForEntity {
  final int id;
  final String name;

  AcaraJSONForEntity({required this.id, required this.name});

  factory AcaraJSONForEntity.fromJson(Map<String, dynamic> json) {
    return AcaraJSONForEntity(
      id: json['id'],
      name: json['name'],
    );
  }
}
