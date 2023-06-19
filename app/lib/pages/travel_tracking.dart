import 'package:flutter/material.dart';
import 'package:projeto_final/widget/drawer_default.dart';

class TravelTracking extends StatelessWidget {
  const TravelTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rastreamento de Viagens')),
      drawer: const DrawerDefault(),
      // ignore: avoid_unnecessary_containers
      body: Container(),
    );
  }
}
