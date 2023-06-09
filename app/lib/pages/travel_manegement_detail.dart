import 'package:flutter/material.dart';

import '../styles/styles.dart';

class TravelManegegementDetail extends StatelessWidget {
  const TravelManegegementDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          "Passagens",
          style: Styles.textBold,
        ),
        Text(
          "Reserva de Hotel",
          style: Styles.textBold,
        ),
        Text(
          "Passagens de Retorno",
          style: Styles.textBold,
        )
      ],
    );
  }
}
