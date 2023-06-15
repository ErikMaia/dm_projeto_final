// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ReservationModel {
  int? reservationId;

  int? travelId;
  int? user;
  ReservationModel({
    this.reservationId,
    this.travelId,
    this.user,
  });

  ReservationModel copyWith({
    int? reservationId,
    int? travelId,
    int? user,
  }) {
    return ReservationModel(
      reservationId: reservationId ?? this.reservationId,
      travelId: travelId ?? this.travelId,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reservationId': reservationId,
      'travelId': travelId,
      'user': user,
    };
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      reservationId: map['reservationId'] != null ? map['reservationId'] as int : null,
      travelId: map['travelId'] != null ? map['travelId'] as int : null,
      user: map['user'] != null ? map['user'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservationModel.fromJson(String source) => ReservationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ReservationModel(reservationId: $reservationId, travelId: $travelId, user: $user)';

  @override
  bool operator ==(covariant ReservationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.reservationId == reservationId &&
      other.travelId == travelId &&
      other.user == user;
  }

  @override
  int get hashCode => reservationId.hashCode ^ travelId.hashCode ^ user.hashCode;
}
