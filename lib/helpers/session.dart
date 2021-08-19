import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static storeData(String key, dynamic value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, jsonEncode(value));
    } catch (ex) {
      print('Error storeData: ${ex.toString()}');
    }
  }

  static dynamic readDataByKey(String key) async {
    dynamic result;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String temp = prefs.getString(key);
      if (temp != null) {
        result = jsonDecode(temp);
      }
    } catch (ex) {
      result = null;
      print('Error readDataByKey: ${ex.toString()}');
    }
    return result;
  }

  static removeDataBykey(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
    } catch (ex) {
      print('Error removeDataBykey: ${ex.toString()}');
    }
  }
}
