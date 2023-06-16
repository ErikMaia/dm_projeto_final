import 'dart:convert';

class UserModel {
  int? userId;
  String? name;
  String? email;
  String? passwords;
  int? age;
  String? card;

  UserModel({
    this.userId,
    this.name,
    this.email,
    this.passwords,
    this.age,
    this.card,
  });

  Map<String, dynamic> toJson() {
    return {
      'UserId': userId,
      'Name': name,
      'Email': email,
      'Passwords': passwords,
      'Age': age,
      'Card': card,
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'name': name,
      'email': email,
      'passwords': passwords,
      'age': age,
      'card': card,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] != null ? map['userId'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      passwords: map['passwords'] != null ? map['passwords'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
      card: map['card'] != null ? map['card'] as String : null,
    );
  }

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
