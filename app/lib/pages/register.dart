import 'package:flutter/material.dart';
import 'package:projeto_final/Data/datasources/user_data.dart';
import 'package:projeto_final/widget/button_default.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _name = TextEditingController();

  void _send(BuildContext context) {
    var navigator = Navigator.of(context);
    UserData.userRegister(
      name: _name.text,
      age: int.parse(_age.text),
      email: _email.text,
      passwords: _password.text,
    );
    navigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(70),
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('Registr'),
          TextField(
            controller: _name,
            decoration: const InputDecoration(
              label: Text('nome'),
            ),
          ),
          // E-mail
          TextField(
            controller: _email,
            decoration: const InputDecoration(
              label: Text('email'),
            ),
          ),
          Container(
            height: 30,
          ),
          // Senha
          TextField(
            controller: _password,
            obscureText: true,
            decoration: const InputDecoration(
              label: Text('password'),
            ),
          ),

          Container(
            height: 30,
          ),
          // Cartão de crédito
          TextField(
              controller: _age,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(label: Text('Idade'))),
          Container(
            height: 50,
          ),
          ButtonDefault(
              text: 'Criar',
              onPress: () {
                _send(context);
              })
        ])),
      ),
    );
  }
}
