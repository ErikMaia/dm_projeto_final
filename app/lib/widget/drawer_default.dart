import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class DrawerDefault extends StatefulWidget {
  const DrawerDefault({super.key});

  @override
  State<DrawerDefault> createState() => _DrawerDefaultState();
}

class _DrawerDefaultState extends State<DrawerDefault> {
  late BuildContext _context;

  String _user = "";
  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _user = prefs.getString("userId")??'';
    setState(() {});
  }

  Future<void> setUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userId", "");
  }

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
          _user != ''
              ? TextButton(
                  onPressed: setUser,
                  child: const Text("Logout"),
                )
              : const Text(""),
        ],
      ),
    );
  }
}
