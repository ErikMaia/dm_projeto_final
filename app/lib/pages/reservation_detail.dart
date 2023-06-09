// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:projeto_final/styles/styles.dart';

import 'package:projeto_final/widget/drawer_default.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReservationDetails extends StatefulWidget {
  const ReservationDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<ReservationDetails> createState() => _ReservationDetailsState();
}

class _ReservationDetailsState extends State<ReservationDetails> {
  String _title = "";

  String _description = "";

  String _imageUrl = "";

  DateTime _startDate = DateTime.now();

  DateTime _endDate = DateTime.now();

  BuildContext? _context;

  Future<void> setInialState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _title = prefs.getString('title')!;
      _description = prefs.getString('description')!;
      _imageUrl = prefs.getString('imageUrl')!;
    });
  }

  Future<void> _selectInitialDate() async {
    final DateTime? picked = await showDatePicker(
      context: _context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
      // Salvar a data selecionada pelo usuário
    }
  }

  Future<void> _selectFinalDate() async {
    final DateTime? picked = await showDatePicker(
      context: _context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
      });
      // Salvar a data selecionada pelo usuário
    }
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    setInialState();
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes de reservas')),
      drawer: DrawerDefault(),
      body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Stack(children: [
              Image.network(
                _imageUrl,
                fit: BoxFit.fill,
              ),
              Container(color: const Color.fromRGBO(0, 0, 0, .5)),
              Center(
                  child: Text(
                _title,
                style: Styles.textBold.copyWith(color: Colors.white70),
              )),
            ]),
          ),
          Text(_description),
          ElevatedButton(
            onPressed: _selectInitialDate,
            child: const Text(
              "Selecionar data Inicial",
            ),
          ),
          ElevatedButton(
            onPressed: _selectFinalDate,
            child: const Text(
              "Selecionar data de Volta",
            ),
          ),
          Text(r"R$ 2000,00",style: Styles.moneyText.copyWith(),)
        ],
      ),
    );
  }
}
