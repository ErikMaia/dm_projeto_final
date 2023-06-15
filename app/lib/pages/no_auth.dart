import 'package:flutter/material.dart';
import 'package:projeto_final/widget/drawer_default.dart';

class NoAuth extends StatefulWidget {
  const NoAuth({super.key});

  @override
  State<NoAuth> createState() => _NoAuthState();
}

class _NoAuthState extends State<NoAuth> {
  // BuildContext? context;

  void _navigateToLogin() {
    Navigator.of(context).pushNamed("login");
  }

  @override
  Widget build(BuildContext context) {
    // this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Falha ao se autenticar'),
        
      ),
      drawer: DrawerDefault(),
      body: Center(
        child: SizedBox(
          width: 100,
          child: TextButton(
            onPressed: _navigateToLogin,
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Icon(Icons.vpn_key_off), Text("Login")],
            ),
          ),
        ),
      ),
    );
  }
}
