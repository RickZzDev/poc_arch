class AuthResponse {
  String? login;
  String? password;
  String? status;

  AuthResponse({this.login, this.password, this.status});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    password = json['password'];
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['senha'] = password;
    return data;
  }
}
