import 'package:flutter/material.dart';
import 'package:projeto_final/widget/button_default.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController? _email;

  TextEditingController? _password;

  TextEditingController? _card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(70),
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('Register'),
          // E-mail
          TextField(controller: _email),
          Container(
            height: 30,
          ),
          // Senha
          TextField(controller: _password),
          Container(
            height: 30,
          ),
          // Cartão de crédito
          TextField(controller: _card),
          Container(
            height: 50,
          ),
          ButtonDefault(
              text: 'Criar',
              onPress: () {
                Navigator.of(context).pop();
              })
        ])),
      ),
    );
  }
}
