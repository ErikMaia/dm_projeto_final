// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:http/http.dart';

import '../../constants.dart';
import '../models/local_model.dart';

class LocalData {
  static Future<void> create(LocalModel reservation) async {
    await post(Uri.parse(Constants.localUrl), body: reservation.toJson());
  }

  static Future<void> remove(int id) async {
    await delete(Uri.parse("${Constants.localUrl}/$id"));
  }

  static Future<LocalModel?> getOne(int id) async {
    var response = await get(Uri.parse("${Constants.localUrl}/$id"));
    if (response.statusCode == 200) {
      return LocalModel.fromMap(json.decode(response.body));
    }
    return null;
  }

  static Future<List<LocalModel>> getAll() async {
    var allReserve = <LocalModel>[];
    var response = await get(Uri.parse(Constants.localUrl));
    if (response.statusCode == 200) {
      final List<dynamic> responseBody = json.decode(response.body);
      allReserve =
          responseBody.map((reserve) => LocalModel.fromJson(reserve)).toList();
    }
    return allReserve;
  }
}
