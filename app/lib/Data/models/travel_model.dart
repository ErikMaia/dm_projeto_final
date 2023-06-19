// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TravelModel {
  int? travelId;
  DateTime startDate;
  DateTime endDate;
  int? positionOrigen;
  int? positionDestination;
  double price;
  TravelModel({
    this.travelId,
    required this.startDate,
    required this.endDate,
    required this.positionOrigen,
    required this.positionDestination,
    required this.price,
  });
  

  TravelModel copyWith({
    int? travelId,
    DateTime? startDate,
    DateTime? endDate,
    int? positionOrigen,
    int? positionDestination,
    double? price,
  }) {
    return TravelModel(
      travelId: travelId ?? this.travelId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      positionOrigen: positionOrigen ?? this.positionOrigen,
      positionDestination: positionDestination ?? this.positionDestination,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'travelId': travelId,
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
      'positionOrigen': positionOrigen,
      'positionDestination': positionDestination,
      'price': price,
    };
  }

  factory TravelModel.fromMap(Map<String, dynamic> map) {
    return TravelModel(
      travelId: map['travelId'] != null ? map['travelId'] as int : null,
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      positionOrigen: map['positionOrigen'] != null ? map['positionOrigen'] as int : null,
      positionDestination: map['positionDestination'] != null ? map['positionDestination'] as int : null,
      price: double.parse(map['price'].toString()) ,
    );
  }

  String toJson() => json.encode(toMap());

  factory TravelModel.fromJson(String source) => TravelModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TravelModel(travelId: $travelId, startDate: $startDate, endDate: $endDate, positionOrigen: $positionOrigen, positionDestination: $positionDestination, price: $price)';
  }

  @override
  bool operator ==(covariant TravelModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.travelId == travelId &&
      other.startDate == startDate &&
      other.endDate == endDate &&
      other.positionOrigen == positionOrigen &&
      other.positionDestination == positionDestination &&
      other.price == price;
  }

  @override
  int get hashCode {
    return travelId.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      positionOrigen.hashCode ^
      positionDestination.hashCode ^
      price.hashCode;
  }
}
