import 'dart:convert';
import '../globals/globals.dart' as globals;
import 'package:http/http.dart' as http;

class ApiHelpers {
  final String enp = "http://aset.kotta.id/";

  Future<dynamic> get(String actionpath) async {
    print('Api get => $actionpath');
    var responseJson;

    try {
      final response = await http.get(Uri.parse(enp + actionpath));

      responseJson = _returnResponse(response);
    } catch (error) {
      print('No Internet');
      Map<String, Object> response = {
        "status": "E",
        "message": "Networ Error",
      };
      responseJson = response;
    }
    return responseJson;
  }

  Future<dynamic> post(String actionPath, var param) async {
    var responseJson;
    var header = globals.userSession == null
        ? {"Accept": "application/json", "content-type": "application/json"}
        : {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer ${globals.userSession?.token}"
          };
    try {
      final response = await http.post(Uri.parse(enp + actionPath),
          headers: header, body: jsonEncode(param));
      responseJson = _returnResponse(response);
    } catch (error) {
      print('No Internet');
      Map<String, Object> response = {
        "status": "E",
        "message": "Networ Error",
      };
      responseJson = response;
    }

    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    Object result = {
      'Status': 'E',
      'Message':
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}'
    };
    switch (response.statusCode) {
      case 200:
        result = json.decode(response.body.toString());
        break;
      case 400:
        result = {'Status': 'E', 'Message': 'Error : Bad Request.'};
        break;
      case 401:
        result = {
          'Status': 'E',
          'Message': 'Error : Sesi Login Habis',
        };
        break;
      case 403:
        result = {
          'Status': 'E',
          'Message': 'Error : Anda Tidak Punya Hak Akses.',
        };
        break;
      case 404:
        result = {
          'Status': 'E',
          'Message': 'Error : Alamat Salah.',
        };
        break;
      case 500:
        result = {
          'Status': 'E',
          'Message': 'Error : Oh Tidak, Ada Kesalah pada Server.',
        };
        break;
      case 502:
        result = {'Status': 'E', 'Message': 'Error : Bad Gateway.'};
        break;
      case 503:
        result = {
          'Status': 'E',
          'Message': 'Error : Server sedang Perbaikan.',
        };
        break;
    }
    print(result);
    return result;
  }
}
