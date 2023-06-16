import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerDefault extends StatelessWidget {
  DrawerDefault({super.key});
  late BuildContext _context;
  void _navigateToTravel() {
    Navigator.of(_context).popAndPushNamed('travel');
  }

  void _navigateToReservation() {
    Navigator.of(_context).popAndPushNamed('reservation');
  }

  void _navigateToManage() {
    Navigator.of(_context).popAndPushNamed('travel_management');
  }

  void _navigateToRaiting() {
    Navigator.of(_context).popAndPushNamed('rating');
  }
  // void _navigateToTracking() {
  //   Navigator.of(_context).popAndPushNamed('travel_tracking');
  // }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text('Aplicativo de Viagens'),
            ),
          ),
          TextButton(
            onPressed: _navigateToTravel,
            child: const Text('Viagens'),
          ),
          TextButton(
            onPressed: _navigateToManage,
            child: const Text('Gerenciar Viagens'),
          ),
          TextButton(
            onPressed: _navigateToReservation,
            child: const Text("Reservas"),
          ),
          TextButton(
            onPressed: _navigateToRaiting,
            child: const Text("Raiting"),
          ),
        ],
      ),
    );
  }
}
