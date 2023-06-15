import 'package:flutter/material.dart';
import 'package:projeto_final/pages/travel_detail.dart';
import 'package:projeto_final/widget/drawer_default.dart';
import 'package:projeto_final/widget/travel_tile.dart';

class Tavel extends StatelessWidget {
  const Tavel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criação de Viagens')),
      drawer: DrawerDefault(),
      // ignore: avoid_unnecessary_containers
      body: 
      Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            TravelTile(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const TravelDetail()),
                );
              },
              title: 'Foz',
              description: "description",
              imageUrl:
                  'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/03/9b/2d/ce/foz-do-iguacu.jpg?w=700&h=500&s=1',
            )
          ],
        ),
      )
    );
  }
}
