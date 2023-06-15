import 'package:flutter/material.dart';
import 'package:projeto_final/pages/reservation_detail.dart';
import 'package:projeto_final/widget/drawer_default.dart';
import 'package:projeto_final/widget/travel_tile.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Reservation extends StatefulWidget {
  const Reservation({super.key});

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  BuildContext? _context;
  String? user;

  void _navigateToDetails(String name, String destination, String origens, DateTime start,DateTime end) {
    Navigator.of(_context!).push(
      MaterialPageRoute(
        builder: (context) => ReservationDetails(
          name: name,
          destination: destination,
          origen: origens,
          start: start,
          end: end,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // if(user == null) {
    //   return SizedBox(height: MediaQuery.of(context).size.width, child: const Center(child: NoAuth()));
    // }
    _context = context;
    return Scaffold(
      appBar: AppBar(title: const Text('Reservas')),
      drawer: DrawerDefault(),
      // ignore: avoid_unnecessary_containers
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          TravelTile(
            onPressed: () {
              _navigateToDetails('Erik', 'Foz do iguaçu', 'Medianeira', DateTime(2000), DateTime.now());
            },
            title: 'Foz do iguaçu',
            description: 'descrição',
            imageUrl:
                'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/03/9b/2d/ce/foz-do-iguacu.jpg?w=700&h=500&s=1',
          ),
        ]),
      ),
    );
  }
}
