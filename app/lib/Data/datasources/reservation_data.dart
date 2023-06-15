// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:projeto_final/Data/models/reservation_model.dart';
import 'package:http/http.dart';

import '../../constants.dart';

class ReservationData {
  static Future<void> create(ReservationModel reservation) async {
    await post(Uri.parse(Constants.reservationUrl),body: reservation.toJson());
    
  }

  static Future<void> remove(int id) async {
    await delete(Uri.parse("${Constants.reservationUrl}/$id"));
  }

  static Future<List<ReservationModel>> getAll() async {
    var allReserve = <ReservationModel>[];
    var response = await get(Uri.parse(Constants.reservationUrl));
    if (response.statusCode == 200) {
      final List<dynamic> responseBody = json.decode(response.body);
      allReserve = responseBody
          .map((reserve) => ReservationModel.fromJson(reserve))
          .toList();
    }
    return allReserve;
  }
}
