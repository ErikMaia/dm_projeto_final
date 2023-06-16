import 'package:flutter/material.dart';
import 'package:projeto_final/Data/datasources/user_data.dart';
import 'package:projeto_final/widget/button_default.dart';
import 'package:projeto_final/widget/drawer_default.dart';
import '../styles/styles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  String _error = "";

  Future<void> auth() async {
    var navigator = Navigator.of(context);
    var email = _email.text;
    var password = _password.text;
    if (email == "") {
      setState(() {
        _error = "email vazio";
      });
      return;
    }
    if (password == "") {
      setState(() {
        _error = "senha vazia";
      });
      return;
    }
    var teste = await UserData.userLogin(email, password);
    if (teste) {
      navigator.pushNamed('reservation');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerDefault(),
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
              obscureText: true,
            ),
            const SizedBox(height: 50),
            ButtonDefault(text: 'Login', onPress: auth),
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
