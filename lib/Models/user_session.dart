class UserSessionModel {
  String token;
  SessionData dataUser;
  UserSessionModel({this.token = "", required this.dataUser});

  Map toJson() => {'token': token, 'dataUser': dataUser};

  @override
  String toString() {
    return toJson().toString();
  }
}

class SessionData {
  String nama;
  String username;
  String aktif;
  String email;
  String urlPhoto;

  SessionData(
      {required this.nama,
      required this.username,
      required this.email,
      required this.aktif,
      required this.urlPhoto});

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
