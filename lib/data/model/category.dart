// ignore_for_file: non_constant_identifier_names

class CategoryJSON {
  late final String name, id, color_id;

  CategoryJSON({
    required this.name,
    required this.id,
  });

  CategoryJSON.fromJson(Map<String, dynamic> json) {
    color_id = json['color_id'];
    id = json['id'].toString();
    name = json['name'];
  }
}
