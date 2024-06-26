// ignore_for_file: non_constant_identifier_names

import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:intl/intl.dart';

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
    DateTime timeconverter = DateTime.parse(json['created_at']);
    String timeview = DateFormat.yMMMEd('id_ID').format(timeconverter);
    id = json['id'];
    tanggal = timeview;
    name = json['name'];
    content = json['content'];
    pic = json['content_img'];
  }
}
