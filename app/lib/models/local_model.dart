import 'dart:convert';

class LocalModel {
    int? localId;
    String? name;
    String? description;
    String? image;
  LocalModel({
    this.localId,
    this.name,
    this.description,
    this.image,
  });

  LocalModel copyWith({
    int? localId,
    String? name,
    String? description,
    String? image,
  }) {
    return LocalModel(
      localId: localId ?? this.localId,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'localId': localId,
      'name': name,
      'description': description,
      'image': image,
    };
  }

  factory LocalModel.fromMap(Map<String, dynamic> map) {
    return LocalModel(
      localId: map['localId'] != null ? map['localId'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalModel.fromJson(String source) => LocalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LocalModel(localId: $localId, name: $name, description: $description, image: $image)';
  }

  @override
  bool operator ==(covariant LocalModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.localId == localId &&
      other.name == name &&
      other.description == description &&
      other.image == image;
  }

  @override
  int get hashCode {
    return localId.hashCode ^
      name.hashCode ^
      description.hashCode ^
      image.hashCode;
  }
}
