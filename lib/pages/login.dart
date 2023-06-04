import 'package:flutter/material.dart';
import 'package:projeto_final/widget/button_default.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController? _email;

  TextEditingController? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Padding(
        padding: const EdgeInsets.only(top: 250, left: 50, right: 50),
        child: Center(
            child: Column(
          children: [
            const Text(
              'login',
            ),
            TextField(
              controller: _email,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _password,
            ),
            const SizedBox(height: 50),
            ButtonDefault(
                text: 'Loguin',
                onPress: () {
                  Navigator.of(context).pushNamed('reservation');
                }),
            const SizedBox(height: 20),
            ButtonDefault(text: 'Registrar', onPress: () {
              Navigator.of(context).pushNamed('register');
            })
          ],
        )),
      ),
    );
  }
}
