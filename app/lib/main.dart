import 'package:flutter/material.dart';
import 'package:projeto_final/pages/rating.dart';
import 'package:projeto_final/pages/login/register.dart';

import 'pages/login/login.dart';
import 'pages/reservation/reservation.dart';
import 'pages/travel/travel.dart';
import 'pages/travel/travel_management.dart';
import 'pages/travel/travel_tracking.dart';

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
      home: const Tavel(),
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
