import 'package:flutter/material.dart';
import 'package:projeto_final/widget/drawer_default.dart';

class TavelManagement extends StatelessWidget {
  const TavelManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gerenciamento de Viagens')),
      drawer: DrawerDefault(),
      body: Container(),
    );
  }
}
