// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:projeto_final/widget/drawer_default.dart';
import 'package:projeto_final/widget/travel_tile.dart';

import '../Data/datasources/local_data.dart';
import '../Data/datasources/reservation_data.dart';
import '../Data/datasources/travel_data.dart';
import '../Data/models/local_model.dart';
import '../Data/models/reservation_model.dart';
import '../Data/models/travel_model.dart';
import '../Data/models/user_model.dart';
import 'no_auth.dart';
import 'reservation_detail.dart';

class TavelManagement extends StatefulWidget {
  const TavelManagement({super.key});



  @override
  State<TavelManagement> createState() => _TavelManagementState();
}

class _TavelManagementState extends State<TavelManagement> {
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
    var userString = prefs.getString("userId") ?? '';
    if (userString != '') {
      user = UserModel.fromMap(jsonDecode(prefs.getString("userId")!));
      _travel = await TravelData.getAll();
      _reservation = await ReservationData.getAll(user!.userId!);
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
                .firstOrNull;
            if (travel == null) {
              return Container();
            }
            var local = _local
                //.where((t) => t.localId == travel.positionDestination)
                .first;
            return TravelTile(
              onPressed: () {
                _navigateToDetails(user!.name!, local.name!, 'Medianeira',
                    travel.startDate, travel.endDate);
              },
              title: local.name!,
              description: local.description!,
              imageUrl: local.image!,
              price: null,
            );
          },
        ),
      ),
    );
  }
}
