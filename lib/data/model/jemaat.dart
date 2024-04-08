class JemaatJSON {
  late final String alamat, jemaatId, name, j_pic;

  JemaatJSON(
      {required this.alamat,
      required this.jemaatId,
      required this.name,
      required this.j_pic});

  JemaatJSON.fromJson(Map<String, dynamic> json) {
    jemaatId = json['jemaat_id'];
    alamat = json['alamat'];
    name = json['name'];
    j_pic = json['j_pic'];
  }
}
