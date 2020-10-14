import 'package:bbd_apps/models/Auth/AuthToken.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthenticationLogic {
  var client = http.Client();

  Future<int> postLogin (email, password) async {
    final prefs = await SharedPreferences.getInstance();
    final data = await client.post('currenturl', body: {
      "email": email,
      "password": password
    });
    if (data.statusCode == 200) {
      prefs.setString("auth", data.body);
    }
    return data.statusCode;
  }

  Future<dynamic> checkLogin () async {
    final prefs = await SharedPreferences.getInstance();
    final data = await json.decode(prefs.getString("auth"));
    final authToken = AuthToken.fromJSON(data);

    try {
      final checkToken = await client.post('currenturl', headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
        "Authorization": authToken.type + ' ' + authToken.token
      });

      return checkToken.statusCode;
    } catch (err) {
      return err.runtimeType.toString();
    }

  }

  Future<void> removeAuth () async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("auth");
  }
}