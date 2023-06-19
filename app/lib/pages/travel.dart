import 'package:flutter/material.dart';
import 'package:projeto_final/Data/datasources/travel_data.dart';
import 'package:projeto_final/Data/models/local_model.dart';
import 'package:projeto_final/Data/models/travel_model.dart';
import 'package:projeto_final/pages/travel_detail.dart';
import 'package:projeto_final/widget/drawer_default.dart';
import 'package:projeto_final/widget/travel_tile.dart';

import '../Data/datasources/local_data.dart';

class Tavel extends StatefulWidget {
  const Tavel({super.key});

  @override
  State<Tavel> createState() => _TavelState();
}

class _TavelState extends State<Tavel> {
  List<TravelModel> _travels = [];
  List<LocalModel> _locals = [];
  Future<void> getTravel() async {
    _travels = await TravelData.getAll();
    _locals = await LocalData.getAll();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getTravel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Viagens')),
      drawer: const DrawerDefault(),
      // ignore: avoid_unnecessary_containers
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: _travels.length,
          itemBuilder: (context, index) {
            var local = _locals
                .where((l) => (l.localId == _travels[index].travelId))
                .first;
            return TravelTile(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TravelDetail(
                      description: local.description!,
                      image: local.image!,
                      name : local.name!,
                      context: context,
                      start: _travels[index].startDate,
                      end: _travels[index].endDate,
                    ),
                  ),
                );
              },
              title: local.name!,
              description: local.description!,
              imageUrl: local.image!, price: _travels[index].price,
            );
          },
        ),
      ),
    );
  }
}
