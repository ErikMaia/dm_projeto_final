import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projeto_final/Data/datasources/reservation_data.dart';
import 'package:projeto_final/Data/datasources/travel_data.dart';
import 'package:projeto_final/Data/models/reservation_model.dart';
import 'package:projeto_final/Data/models/travel_model.dart';
import 'package:projeto_final/pages/reservation_detail.dart';
import 'package:projeto_final/widget/drawer_default.dart';
import 'package:projeto_final/widget/travel_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Data/datasources/local_data.dart';
import '../Data/models/local_model.dart';
import '../Data/models/user_model.dart';
import 'no_auth.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Reservation extends StatefulWidget {
  const Reservation({super.key});

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  BuildContext? _context;
  UserModel? user;
  List<ReservationModel> _reservation = [];
  List<TravelModel> _travel = [];
  List<LocalModel> _local = [];

  void _navigateToDetails(String name, String destination, String origens,
      DateTime start, DateTime end) {
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

  Future<void> getReservationDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userString = prefs.getString("userId")??'';
    if (userString != '') {
      user = UserModel.fromMap(jsonDecode(prefs.getString("userId")!));
      _travel = await TravelData.getAll();
      _reservation = await ReservationData.getAll();
      _local = await LocalData.getAll();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getReservationDetails();
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const NoAuth();
    }
    _context = context;
    return Scaffold(
      appBar: AppBar(title: const Text('Reservas')),
      drawer: const DrawerDefault(),
      // ignore: avoid_unnecessary_containers
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: _reservation.length,
            itemBuilder: (context, index) {
              var travel = _travel
                  .where((t) => t.travelId == _reservation[index].travelId)
                  .first;
              var local = _local
                  .where((t) => t.localId == travel.positionDestination)
                  .first;
              return TravelTile(
                onPressed: () {
                  _navigateToDetails(user!.name!, local.name!, 'Medianeira',
                      travel.startDate, travel.startDate);
                },
                title: local.name!,
                description: local.description!,
                imageUrl: local.image!,
                price: null,
              );
            },
          )
          // ListView(
          //   children: [
          //     TravelTile(
          //       onPressed: () {
          //         _navigateToDetails('Erik', 'Foz do iguaçu', 'Medianeira',
          //             DateTime(2000), DateTime.now());
          //       },
          //       title: 'Foz do iguaçu',
          //       description: 'descrição',
          //       imageUrl:
          //           'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/03/9b/2d/ce/foz-do-iguacu.jpg?w=700&h=500&s=1',
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
