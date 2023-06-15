import 'package:flutter/material.dart';
import 'package:projeto_final/pages/login.dart';
import 'package:projeto_final/pages/rating.dart';
import 'package:projeto_final/pages/register.dart';
import 'package:projeto_final/pages/reservation.dart';
import 'package:projeto_final/pages/travel_tracking.dart';

import 'pages/travel.dart';
import 'pages/travel_management.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Viagens',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        
      ),
      home: const Rating(),
      routes: {
        // registro
        'register': (context) => const Register(),
        // login
        'login': (context) => const Login(),
        // Busca de viagens
        'travel': (context) => const Tavel(),
        // Reserva de viagens
        'reservation': (context) => const Reservation(),
        // Gerenciamento de reservas
        'travel_management': (context) => const TavelManagement(),
        // Rastreamento de viagens
        'travel_tracking': (context) => const TravelTracking(),
        // Avaliação de viagens
        'rating': (context) => const Rating()
      },
    );
  }
}
