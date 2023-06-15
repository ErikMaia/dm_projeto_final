// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Passaport extends StatelessWidget {
  const Passaport({
    Key? key,
    required this.origen,
    required this.name,
    required this.start,
    required this.destiny,
  }) : super(key: key);

  final String origen;
  final String name;
  final DateTime start;
  final String destiny;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Embarque'), Text('Desembarque')],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("${start.day}/${start.month}/${start.year}"), Text("${start.day}/${start.month}/${start.year}")],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Destino'),
            Text('Documento'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(destiny),
            const Text('2135123'),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('EMBARQUE'), Text('DATA'), Text('ASSENTO')],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('${start.hour}:${start.minute}'), Text('${start.day}/${start.month}/${start.year}'), const Text('27D')],
        ),
      ],
    );
  }
}
