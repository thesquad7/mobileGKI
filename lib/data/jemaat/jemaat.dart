import 'dart:convert';

class JemaatJSON {
  String? alamat;
  String? jemaatId;
  String? name;
  String? j_pic;

  JemaatJSON({this.alamat, this.jemaatId, this.name, this.j_pic});

  @override
  String toString() {
    return 'Jemaat(alamat: $alamat, jemaatId: $jemaatId, name: $name, j_pic: $j_pic)';
  }

  factory JemaatJSON.fromMap(Map<String, dynamic> data) => JemaatJSON(
      alamat: data['alamat'] as String?,
      jemaatId: data['jemaat_id'] as String?,
      name: data['name'] as String?,
      j_pic: data['j_pic'] as String?);

  Map<String, dynamic> toMap() => {
        'alamat': alamat,
        'jemaat_id': jemaatId,
        'name': name,
        'j_pic': j_pic,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Jemaat].
  factory JemaatJSON.fromJson(String data) {
    return JemaatJSON.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Jemaat] to a JSON string.
  String toJson() => json.encode(toMap());
}
