class UserSessionModel {
  String token;
  SessionData dataUser;
  UserSessionModel({this.token = "", this.dataUser});

  Map toJson() => {'token': token, 'dataUser': dataUser};

  @override
  String toString() {
    return toJson().toString();
  }
}

class UserModel {
  String token;
  String name;
  String email;
  String username;

  UserModel(
      {this.token = "", this.name = "", this.email = "", this.username = ""});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['data']['name'];
    email = json['data']['email'];
    username = json['data']['username'];
  }

  Map<String, dynamic> toJson() {
    return {'token': token};
  }
}

class SessionData {
  String nama;
  String username;
  String aktif;
  String email;
  String urlPhoto;

  SessionData(
      {this.nama = "",
      this.username = "",
      this.email = "",
      this.aktif = "",
      this.urlPhoto = ""});

  Map toJson() => {
        'nama': nama,
        'username': username,
        'email': email,
        'aktif': aktif,
        'urlPhoto': urlPhoto,
      };
  @override
  String toString() {
    return toJson().toString();
  }
}
