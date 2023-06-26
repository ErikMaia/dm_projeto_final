// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:projeto_final/widget/drawer_default.dart';

// ignore: must_be_immutable
class TravelManegegementDetail extends StatelessWidget {
  final double height = 100;
  final String? title;
  VoidCallback onDelete;

  TravelManegegementDetail({
    Key? key,
    this.title,
    required this.onDelete,
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
                onPressed: onDelete,
                child: const Text('CANCELAR'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: height,
              child: ElevatedButton(
                onPressed: onDelete,
                child: const Text('REMARCAR'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: height,
              child: ElevatedButton(
                onPressed: onDelete,
                child: const Text('REEMBOLSO'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
