// ignore_for_file: non_constant_identifier_names

class KesaksianJSON {
  late final String tanggal, name, pic, id, content, user_pic, user_name;
  late final int user_id;
  KesaksianJSON(
      {required this.tanggal,
      required this.name,
      required this.user_id,
      required this.pic,
      required this.user_pic,
      required this.user_name,
      required this.content,
      required this.id});

  KesaksianJSON.fromJson(Map<String, dynamic> json) {
    tanggal = json['tanggal'];
    name = json['name'];
    user_pic = json['user']['profile_img'];
    content = json['content'];
    id = json['id'].toString();
    user_name = json['user']['name'].toString();
    user_id = json['user']['id'];
    pic = json['content_img'];
  }
}

class KesaksianJSONForEntity {
  final int id;
  final String name, profile_img;

  KesaksianJSONForEntity(
      {required this.id, required this.profile_img, required this.name});

  factory KesaksianJSONForEntity.fromJson(Map<String, dynamic> json) {
    return KesaksianJSONForEntity(
      id: json['id'],
      profile_img: (json['profile_img']),
      name: json['name'],
    );
  }
}
