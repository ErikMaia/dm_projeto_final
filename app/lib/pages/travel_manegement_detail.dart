// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:projeto_final/styles/styles.dart';
import 'package:projeto_final/widget/drawer_default.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Data/datasources/reservation_data.dart';

class TravelManegegementDetail extends StatefulWidget {
  const TravelManegegementDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<TravelManegegementDetail> createState() =>
      _TravelManegegementDetailState();
}

class _TravelManegegementDetailState extends State<TravelManegegementDetail> {
  int _id = 0;
  String _title = "";
  String _description = "";
  String _imageUrl = "";
  BuildContext? _context;
  Future<void> setInialState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _id = prefs.getInt('revervation_id')!;
      _title = prefs.getString('title')!;
      _description = prefs.getString('description')!;
      _imageUrl = prefs.getString('imageUrl')!;
    });
  }

  void _delete() {
    ReservationData.remove(_id);
    Navigator.of(_context!).popAndPushNamed('travel_management');
  }

  

  @override
  Widget build(BuildContext context) {
    _context = context;
    setInialState();
    return Scaffold(
      appBar: AppBar(title: const Text('Gerenciar Viagens')),
      drawer: const DrawerDefault(),
      body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Stack(children: [
              Image.network(
                _imageUrl,
                fit: BoxFit.cover,
              ),
              Container(color: const Color.fromRGBO(0, 0, 0, .5)),
              Center(
                  child: Text(
                _title,
                style: Styles.textBold.copyWith(color: Colors.white70),
              )),
            ]),
          ),
          SizedBox(height: 120 ,child: Text(_description),),
          SizedBox(
            
            child: Text(
              r"R$ 2000,00",
              style: Styles.moneyText,
            ),
          ),
          ElevatedButton(
            onPressed: _delete,
            child: const Text(
              "Apagar",
            ),
          ),
          ElevatedButton(
            onPressed: _delete,
            child: const Text(
              "Reembolsado",
            ),
          ),
          
        ],
      ),
    );
  }
}
