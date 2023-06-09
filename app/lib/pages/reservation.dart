import 'package:flutter/material.dart';
import 'package:projeto_final/pages/reservation_detail.dart';
import 'package:projeto_final/widget/drawer_default.dart';
import 'package:projeto_final/widget/travel_tile.dart';

// ignore: must_be_immutable
class Reservation extends StatelessWidget {
  Reservation({super.key}) ;

  BuildContext? _context;
  void navigateToDetails(){
    Navigator.of(_context!).push(
      MaterialPageRoute(
          builder: (context) => const ReservationDetails()),
    );
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: AppBar(title: const Text('Reservas')),
      drawer: DrawerDefault(),
      // ignore: avoid_unnecessary_containers
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          TravelTile(
            onPressed: navigateToDetails,
            title: 'Foz do iguaçu',
            description: 'descrição',
            imageUrl: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/03/9b/2d/ce/foz-do-iguacu.jpg?w=700&h=500&s=1',
          ),
          
        ]),
      ),
    );
  }
}
