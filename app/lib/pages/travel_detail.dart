// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:projeto_final/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TravelDetail extends StatelessWidget {
  final String description;
  final String image;
  final DateTime start;
  
  BuildContext context;
  TravelDetail({
    Key? key,
    required this.description,
    required this.image,
    required this.start,
    required this.context,
  }) : super(key: key);

  Future<void> _enviar() async {
    var navigator = Navigator.of(context);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var user = pref.getString('userId');
    if (user == null) {
      navigator.popAndPushNamed('login');
    }
    http.post(Uri.parse(Constants.travelUrl));
    navigator.popAndPushNamed('reservation');
  }

  @override
  Widget build(BuildContext context) {
    context = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe da viagem'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .4,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [Text(description)],
            ),
          ),
          Image.network(image),
          Text(start.toString()),
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
