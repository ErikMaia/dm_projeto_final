// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:projeto_final/widget/drawer_default.dart';

import 'package:projeto_final/widget/passaport.dart';

import '../styles/styles.dart';

class ReservationDetails extends StatelessWidget {
  const ReservationDetails({
    Key? key,
    required this.name,
    required this.origen,
    required this.destination,
    required this.start,
    required this.end,
  }) : super(key: key);
  final String name;
  final String origen;
  final String destination;
  final DateTime start;
  final DateTime end;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const DrawerDefault(),
      body: ListView(
        children: [
          Text(
            "Passagens",
            style: Styles.textBold,
          ),
          Passaport(
            name: name,
            origen: origen,
            start: start,
            destiny: destination,
          ),
          Text(
            "Reserva de Hotel",
            style: Styles.textBold,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Responsavel'),
              Text(name),
            ],
          ),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Local'), Text('Simples')]),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Hóspede'),
              Text('1 Adulto'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Data de Entrada'),
              Text('${start.day}/${start.month}/${start.year}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Data de Saída'),
              Text('${end.day}/${end.month}/${end.year}'),
            ],
          ),
          Text(
            "Passagens de Retorno",
            style: Styles.textBold,
          ),
          Passaport(
            name: name,
            origen: destination,
            start: end,
            destiny: origen,
          ),
        ],
      ),
    );
  }
}
