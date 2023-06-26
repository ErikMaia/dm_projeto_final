

// ignore: must_be_immutable
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Data/datasources/local_data.dart';
import '../../Data/datasources/reservation_data.dart';
import '../../Data/datasources/travel_data.dart';
import '../../Data/models/local_model.dart';
import '../../Data/models/reservation_model.dart';
import '../../Data/models/travel_model.dart';
import '../../Data/models/user_model.dart';
import '../../widget/drawer_default.dart';
import '../../widget/travel_tile.dart';
import '../login/no_auth.dart';
import 'travel_manegement_detail.dart';

class TravelManagement extends StatefulWidget {
  const TravelManagement({super.key});

  @override
  State<TravelManagement> createState() => _TravelManagementState();
}

class _TravelManagementState extends State<TravelManagement> {
  BuildContext? _context;
  UserModel? user;
  List<ReservationModel> _reservation = [];
  List<TravelModel> _travel = [];
  List<LocalModel> _local = [];

  void _navigateToDetails(int id) {
    Navigator.of(_context!).push(
      MaterialPageRoute(
        builder: (context) => TravelManegegementDetail(
          id:id
        ),
      ),
    );
  }

  Future<void> getTravelManagementDetails() async {
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
    getTravelManagementDetails();
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const NoAuth();
    }
    _context = context;
    return Scaffold(
      appBar: AppBar(title: const Text('Gerenciamento de Viagens')),
      drawer: const DrawerDefault(),
      // ignore: avoid_unnecessary_containers
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _reservation.length,
          itemBuilder: (context, index) {
            var reservation = _reservation[index];
            var travel = _travel
                .firstWhere((element) => element.travelId == reservation.reservationTravel);
            var local = _local
                //.where((t) => t.localId == travel.positionDestination)
                .firstWhere((element) => element.localId == travel.positionDestination);
            return TravelTile(
              onPressed: () {
                _navigateToDetails(reservation.reservationId);
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

