// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
// import 'package:http/http.dart';
import '../../constants.dart';
import '../models/travel_model.dart';
import 'package:http/http.dart' as http;

class TravelData {
  static Future<void> create(TravelModel reservation) async {
    await http.post(Uri.parse(Constants.travelUrl), body: reservation.toJson());
  }

  static Future<void> remove(int id) async {
    await http.delete(Uri.parse("${Constants.travelUrl}/$id"));
  }

  static Future<List<TravelModel>> getAll() async {
    var allReserve = <TravelModel>[];
    var response = await http.get(Uri.parse(Constants.travelUrl));
    if (response.statusCode == 200) {
      final List<dynamic> responseBody = json.decode(response.body);
      allReserve =
          responseBody.map((reserve) => TravelModel.fromMap(reserve)).toList();
    }
    return allReserve;
  }
}
