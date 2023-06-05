import 'package:flutter/material.dart';
import 'package:projeto_final/widget/drawer_default.dart';
import 'package:projeto_final/widget/travel_tile.dart';

class Reservation extends StatelessWidget {
  const Reservation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reservas')),
      drawer: DrawerDefault(),
      // ignore: avoid_unnecessary_containers
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          TravelTile(
            title: 'Foz do iguaçu',
            description: 'descrição',
            imageUrl: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/03/9b/2d/ce/foz-do-iguacu.jpg?w=700&h=500&s=1',
          ),
          
        ]),
      ),
    );
  }
}
