// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:projeto_final/Data/models/reservation_model.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class ReservationData {
  static Future<bool> create(ReservationModel reservation) async {
    var body = jsonEncode(reservation.toMap()); // Converter o mapa em uma String JSON
    var response = await http.post(
      Uri.parse(Constants.reservationUrl),
      headers: {'Content-Type': 'application/json'}, // Definir o cabeçalho Content-Type como application/json
      body: body,
    );

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<void> remove(int id) async {
    await http.delete(Uri.parse("${Constants.reservationUrl}/$id"));
  }

  static Future<List<ReservationModel>> getAll(int id) async {
    var allReserve = <ReservationModel>[];
    var response = await http.get(Uri.parse("${Constants.reservationUrl}/$id"));
    if (response.statusCode == 200) {
      final List<dynamic> responseBody = json.decode(response.body);
      allReserve = responseBody
          .map((reserve) => ReservationModel.fromMap(reserve))
          .toList();
    }
    return allReserve;
  }
}
