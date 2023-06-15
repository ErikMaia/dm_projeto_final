// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TravelModel {
  int? travelId;
  DateTime? startDate;
  DateTime? endDate;
  int? positionOrigen;
  int? positionDestination;
  TravelModel({
    this.travelId,
    this.startDate,
    this.endDate,
    this.positionOrigen,
    this.positionDestination,
  });

  TravelModel copyWith({
    int? travelId,
    DateTime? startDate,
    DateTime? endDate,
    int? positionOrigen,
    int? positionDestination,
  }) {
    return TravelModel(
      travelId: travelId ?? this.travelId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      positionOrigen: positionOrigen ?? this.positionOrigen,
      positionDestination: positionDestination ?? this.positionDestination,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'travelId': travelId,
      'startDate': startDate?.millisecondsSinceEpoch,
      'endDate': endDate?.millisecondsSinceEpoch,
      'positionOrigen': positionOrigen,
      'positionDestination': positionDestination,
    };
  }

  factory TravelModel.fromMap(Map<String, dynamic> map) {
    return TravelModel(
      travelId: map['travelId'] != null ? map['travelId'] as int : null,
      startDate: map['startDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['startDate'] as int) : null,
      endDate: map['endDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['endDate'] as int) : null,
      positionOrigen: map['positionOrigen'] != null ? map['positionOrigen'] as int : null,
      positionDestination: map['positionDestination'] != null ? map['positionDestination'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TravelModel.fromJson(String source) => TravelModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TravelModel(travelId: $travelId, startDate: $startDate, endDate: $endDate, positionOrigen: $positionOrigen, positionDestination: $positionDestination)';
  }

  @override
  bool operator ==(covariant TravelModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.travelId == travelId &&
      other.startDate == startDate &&
      other.endDate == endDate &&
      other.positionOrigen == positionOrigen &&
      other.positionDestination == positionDestination;
  }

  @override
  int get hashCode {
    return travelId.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      positionOrigen.hashCode ^
      positionDestination.hashCode;
  }
  }
