import 'package:flutter/widgets.dart';
import 'package:furnito_chart/Models/user_session.dart';
import 'package:furnito_chart/services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> login({
    String email,
    String password,
  }) async {
    try {
      dynamic user =
          await AuthService().login(email: email, password: password);

      _user = user;
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }
}
