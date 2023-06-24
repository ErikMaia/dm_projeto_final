// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:projeto_final/Data/datasources/reservation_data.dart';
import 'package:projeto_final/Data/models/reservation_model.dart';
import 'package:projeto_final/Data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TravelDetail extends StatelessWidget {
  final String description;
  final String image;
  final DateTime start;
  final DateTime end;
  final String name;
  final int id;
  BuildContext context;
  TravelDetail({
    Key? key,
    required this.description,
    required this.image,
    required this.start,
    required this.end,
    required this.name,
    required this.id,
    required this.context,
  }) : super(key: key);

  Future<void> _enviar() async {
    var navigator = Navigator.of(context);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var user = pref.getString('userId');
    if (user == null) {
      navigator.popAndPushNamed('login');
    }
    var userId = UserModel.fromJson(user!).userId;
    var reservation = ReservationModel(reservationTravel: id, reservationUser: userId!, reservationId: 0);
    await ReservationData.create(reservation);
    navigator.popAndPushNamed('reservation');
  }

  @override
  Widget build(BuildContext context) {
    context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .4,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Text(
                description,
              ),
            ),
          ),
          Image.network(image),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text("${start.day}/${start.month}/${start.year}"),
            const Icon(Icons.flight),
            Text("${end.day}/${end.month}/${end.year}")
          ]),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: _enviar,
              child: const Text('Reservar'),
            ),
          )
        ],
      ),
    );
  }
}
