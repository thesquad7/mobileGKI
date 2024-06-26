// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';

class PengunjungJSON {
  PengunjungJSON(
      {this.visit_t,
      this.jemaat_t,
      this.id,
      this.steam_count,
      this.total,
      this.jadwal_name,
      this.jadwal_date,
      this.jadwal_type,
      this.jadwal_bg,
      this.jadwal_host,
      this.jadwal_host_img,
      this.jadwal_place});
  int? id, jemaat_t, visit_t, steam_count, total;
  String? jadwal_name,
      jadwal_bg,
      jadwal_date,
      jadwal_host,
      jadwal_type,
      jadwal_host_img,
      jadwal_place;

  PengunjungJSON.fromJson(Map<String, dynamic> json) {
    DateTime timeconverter = DateTime.parse(json['jadwal']['date']);
    String timeview = DateFormat.yMMMEd('id_ID').format(timeconverter);
    jemaat_t = json['jemaat_total'];
    id = json['id'];
    total = json['total'];
    visit_t = json['visit_total'];
    steam_count = json['stream_count'];
    jadwal_name = json['jadwal']['name'];
    jadwal_date = timeview;
    jadwal_type = json['jadwal']['jenis'];
    jadwal_host = json['jadwal']['pendeta'];
    jadwal_host_img = json['jadwal']['p_pic'];
    jadwal_place = json['jadwal']['place'];
    jadwal_bg = json['jadwal']['file'];
  }
}

class PengunjungJSONForEntity {
  final int id;
  final String name;
  final String tanggal;
  final String pic;
  final String content;
  final String pendeta;
  final String pendeta_pic;
  final String place;
  final String category_name;

  PengunjungJSONForEntity({
    required this.id,
    required this.name,
    required this.tanggal,
    required this.pic,
    required this.content,
    required this.pendeta,
    required this.pendeta_pic,
    required this.place,
    required this.category_name,
  });

  factory PengunjungJSONForEntity.fromJson(Map<String, dynamic> json) {
    return PengunjungJSONForEntity(
      id: json['id'],
      name: json['name'],
      tanggal: json['tanggal'],
      pic: json['content_img'],
      content: json['content'],
      pendeta: json['pendeta']['name'],
      pendeta_pic: json['pendeta']['pic'],
      place: json['church']['name'],
      category_name: json['category']['name'],
    );
  }
}
