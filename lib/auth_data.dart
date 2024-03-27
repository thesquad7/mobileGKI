class AuthData {
  String? accessToken;
  String? tokenType;

  AuthData({this.accessToken, this.tokenType});

  AuthData.fromJson(Map<String, dynamic> json) {
    accessToken = json["access_token"];
    tokenType = json["token_type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["access_token"] = accessToken;
    _data["token_type"] = tokenType;
    return _data;
  }
}
