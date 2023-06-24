
// ignore_for_file: public_member_api_docs, sort_constructors_first

class ReservationModel {
  int reservationId;
  int reservationTravel;
  int reservationUser;
  ReservationModel({
    required this.reservationId,
    required this.reservationTravel,
    required this.reservationUser,
  });


  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      reservationId: json['reservationId'],
      reservationTravel: json['reservationTravel'],
      reservationUser: json['reservationUser'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reservationId': reservationId,
      'reservationTravel': reservationTravel,
      'reservationUser': reservationUser,
    };
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      reservationId: map['reservationId'] as int,
      reservationTravel: map['reservationTravel'] as int,
      reservationUser: map['reservationUser'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reservationId': reservationId,
      'reservationTravel': reservationTravel,
      'reservationUser': reservationUser,
    };
  }

  ReservationModel copyWith({
    int? reservationId,
    int? reservationTravel,
    int? reservationUser,
  }) {
    return ReservationModel(
      reservationId: reservationId ?? this.reservationId,
      reservationTravel: reservationTravel ?? this.reservationTravel,
      reservationUser: reservationUser ?? this.reservationUser,
    );
  }

  
  @override
  String toString() => 'ReservationModel(reservationId: $reservationId, reservationTravel: $reservationTravel, reservationUser: $reservationUser)';

  @override
  bool operator ==(covariant ReservationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.reservationId == reservationId &&
      other.reservationTravel == reservationTravel &&
      other.reservationUser == reservationUser;
  }

  @override
  int get hashCode => reservationId.hashCode ^ reservationTravel.hashCode ^ reservationUser.hashCode;
}
