import 'package:furnito_chart/Models/user_session.dart';
import 'package:furnito_chart/helpers/api_helpers.dart';
import 'package:furnito_chart/helpers/session.dart';
import '../globals/globals.dart' as globals;

class AuthService {
  ApiHelpers api = new ApiHelpers();
  UserModel user = new UserModel();

  Future<dynamic> login({String email, String password}) async {
    var result;

    Map<String, String> param = {"username": email, "password": password};

    try {
      result = await api.post('api/login', param);

      user = UserModel.fromJson(result);

      if (user != null) {
        // print('login berhasil');

        UserSessionModel session = new UserSessionModel();
        SessionData dataUser = new SessionData();
        dataUser.nama = user.name;
        dataUser.email = user.email;
        dataUser.username = user.username;

        session.token = user.token;
        session.dataUser = dataUser;

        await Session.storeData('userSession', session);
        globals.userSession = session;
        print('user sesion global ${globals.userSession}');
        print('${Session.readDataByKey('userSession')}');
      } else {
        print('set token failed');
      }
    } catch (error) {
      print('error : $error');
    }
    return user;
  }
}
