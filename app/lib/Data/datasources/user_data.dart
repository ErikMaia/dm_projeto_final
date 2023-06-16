import 'package:http/http.dart' as http;
import 'package:projeto_final/Data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../constants.dart';

class UserData {
  static Future<bool> userLogin(String email, String password) async {
    final response = await http.post(
      Uri.parse('${Constants.userUrl}/login'),
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'passwords': password,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var user = UserModel.fromMap(json.decode(response.body));
      prefs.setInt('userId', user.userId!);
      return true;
    } else {
      //print('Falha no login');
      return false;
    }
  }

  static Future<bool> userRegister({
    required String name,
    required String email,
    required String passwords,
    required int age,
  }) async {
    final response = await http.post(
      Uri.parse('${Constants.userUrl}/register'),
      body: jsonEncode(UserModel(
        email: email,
        passwords: passwords,
        name: name,
        age: age,
      )),
      headers: {'Content-Type': 'application/json'},
    );

    return response.statusCode == 200;
  }
}
