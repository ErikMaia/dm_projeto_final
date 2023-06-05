import 'package:flutter/material.dart';
import 'package:projeto_final/widget/drawer_default.dart';

class Tavel extends StatelessWidget {
  const Tavel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criação de Viagens')),
      drawer: DrawerDefault(),
      // ignore: avoid_unnecessary_containers
      body: Container(),
    );
  }
}
