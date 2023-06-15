import 'package:flutter/material.dart';
import 'package:projeto_final/widget/drawer_default.dart';
import 'package:projeto_final/widget/travel_tile.dart';
import 'travel_manegement_detail.dart';

class TavelManagement extends StatelessWidget {
  const TavelManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gerenciamento de Viagens')),
      drawer: DrawerDefault(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            TravelTile(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const TravelManegegementDetail()),
                );
              },
              title: 'Foz',
              description: "description",
              imageUrl:
                  'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/03/9b/2d/ce/foz-do-iguacu.jpg?w=700&h=500&s=1',
            )
          ],
        ),
      ),
    );
  }
}
