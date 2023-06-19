// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:projeto_final/constants.dart';

class TravelDetail extends StatelessWidget {
  final String description;
  final String image;
  final DateTime start;
  final DateTime end;
  final String name;
  BuildContext context;
  TravelDetail({
    Key? key,
    required this.description,
    required this.image,
    required this.start,
    required this.end,
    required this.name,
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
