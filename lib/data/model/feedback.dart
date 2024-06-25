// ignore_for_file: non_constant_identifier_names

class FeedbackJSON {
  late final String tanggal, name, pic, content;
  late final int? id;
  FeedbackJSON({
    required this.tanggal,
    required this.name,
    this.id,
    required this.pic,
    required this.content,
  });

  FeedbackJSON.fromJson(Map<String, dynamic> json) {
    tanggal = json['tanggal'];
    name = json['name'];
    content = json['content'];
    id = json['user']['id'];
    pic = json['content_img'];
  }
}
