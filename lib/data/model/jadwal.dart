// ignore_for_file: non_constant_identifier_names

class JadwalJSON {
  late final String tanggal,
      name,
      pic,
      id,
      content,
      category_id,
      pendeta,
      pendeta_pic,
      place,
      category_name;
  int? color_id;
  JadwalJSON(
      {required this.tanggal,
      required this.name,
      required this.place,
      required this.pendeta,
      required this.pic,
      required this.pendeta_pic,
      required this.category_name,
      required this.content,
      required this.category_id,
      required this.id});

  JadwalJSON.fromJson(Map<String, dynamic> json) {
    tanggal = json['tanggal'];
    name = json['name'];
    pendeta = json['pendeta']['name'];
    pendeta_pic = json['pendeta']['pic'];
    place = json['church']['name'];
    content = json['content'];
    id = json['id'].toString();
    category_name = json['category']['name'].toString();
    color_id = int.parse(json['category']['color_id']);
    pic = json['content_img'];
  }
}

class JadwalJSONForEntity {
  final int id;
  final String name;

  JadwalJSONForEntity({required this.id, required this.name});

  factory JadwalJSONForEntity.fromJson(Map<String, dynamic> json) {
    return JadwalJSONForEntity(
      id: json['id'],
      name: json['name'],
    );
  }
}
