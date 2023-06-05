// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:projeto_final/widget/drawer_default.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReservationDetails extends StatefulWidget {
  const ReservationDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<ReservationDetails> createState() => _ReservationDetailsState();
}

class _ReservationDetailsState extends State<ReservationDetails> {
  String title = "";

  String description = "";

  String imageUrl = "";

  Future<void> setInialState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    /* 
      prefs.setString('title', title);
      prefs.setString('description', description);
      prefs.setString('imageUrl', imageUrl); 
    */
    title = prefs.getString('title')!;
    description = prefs.getString('description')!;
    imageUrl = prefs.getString('imageUrl')!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setInialState();
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes de reservas')),
      drawer: DrawerDefault(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            Text(title),
            Text(description),
            Image.network(imageUrl),

            
          ],
        ),
      ),
    );
  }
}
