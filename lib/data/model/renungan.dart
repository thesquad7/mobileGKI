// ignore_for_file: non_constant_identifier_names

class RenunganJSON {
  late final String tanggal, name, category_name, pic, id, content, color_id;

  RenunganJSON(
      {required this.tanggal,
      required this.name,
      required this.pic,
      required this.color_id,
      required this.category_name,
      required this.content,
      required this.id});

  RenunganJSON.fromJson(Map<String, dynamic> json) {
    tanggal = json['tanggal'];
    name = json['name'];
    content = json['content'];
    id = json['id'].toString();
    color_id = json['category']['color_id'];
    category_name = json['category']['name'];
    pic = json['content_img'];
  }
}

class RenunganJSONForEntity {
  final int id, color_id;
  final name;

  RenunganJSONForEntity(
      {required this.id, required this.name, required this.color_id});

  factory RenunganJSONForEntity.fromJson(Map<String, dynamic> json) {
    return RenunganJSONForEntity(
      id: json['id'],
      name: json['name'],
      color_id: int.parse((json['color_id'])),
    );
  }
}
