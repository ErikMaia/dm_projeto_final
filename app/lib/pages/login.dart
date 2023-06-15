import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projeto_final/widget/button_default.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../styles/styles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController? _email;

  TextEditingController? _password;

  String _error = "";

  Future<void> auth() async {
    var email = _email?.text;
    var password = _password?.text;
    if (email == "") {
      _error = "email vazio";
      return;
    }
    if (password == "") {
      _error = "senha vazia";
      return;
    }

    final url = Uri.parse('http://192.168.0.105:80/login');

    final user = UserModel(
      email: email,
      passwords: password,
    );

    final requestBody = jsonEncode(user.toJson());

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: requestBody,
    );

    if (response.statusCode == 200) {
      // Requisição bem-sucedida, faça o tratamento da resposta aqui
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("user", response.body);
      _error = "";
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    }
    _error = "não encontrado";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Padding(
        padding: const EdgeInsets.only(top: 250, left: 50, right: 50),
        child: Center(
            child: Column(
          children: [
            Text(
              'login',
              style: Styles.textBold,
            ),
            TextField(
              decoration: const InputDecoration(
                label: Text('email'),
              ),
              controller: _email,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                label: Text('password'),
              ),
              controller: _password,
            ),
            const SizedBox(height: 50),
            ButtonDefault(
                text: 'Login',
                onPress: () {
                  Navigator.of(context).pushNamed('reservation');
                }),
            SizedBox(
                height: 20,
                child: Text(
                  _error,
                  style: TextStyle(color: Colors.red[600]),
                )),
            ButtonDefault(
                text: 'Registrar',
                onPress: () {
                  Navigator.of(context).pushNamed('register');
                })
          ],
        )),
      ),
    );
  }
}
