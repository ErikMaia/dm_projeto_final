// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:projeto_final/Data/datasources/reservation_data.dart';
import 'package:projeto_final/widget/drawer_default.dart';

class TravelManegegementDetail extends StatelessWidget {
  final int id;
  final double height = 100;
  final String? title;
  Future<void> remove(BuildContext context) async {
    await ReservationData.remove(id);
    Navigator.of(context).pop();
  }

  const TravelManegegementDetail({
    Key? key,
    required this.id,
    this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ''),
      ),
      drawer: const DrawerDefault(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: height,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  remove(context);
                },
                child: const Text('CANCELAR'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: height,
              child: ElevatedButton(
                onPressed: () {
                  remove(context);
                },
                child: const Text('REMARCAR'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: height,
              child: ElevatedButton(
                onPressed: () {
                  remove(context);
                },
                child: const Text('REEMBOLSO'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
