// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dalil_syria/features/profile/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel({
    required super.id,
    required super.email,
    required super.fullName,
    required super.phone,
    required super.city,
    required super.createdAt,
  });

  ProfileModel copyWith({
    String? id,
    String? email,
    String? fullName,
    String? phone,
    String? city,
    String? createdAt,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'full_name': fullName,
      'created_at': createdAt,
      'phone': phone,
      'city': city,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] as String,
      email: map['email'] as String? ?? '',
      fullName: map['full_name'] as String? ?? 'No Name',
      phone: map['phone'] as String? ?? '-',
      city: map['city'] as String? ?? '-',
      createdAt: map['created_at'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileModel(id: $id, email: $email, fullName: $fullName, phone: $phone, city: $city, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant ProfileModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.fullName == fullName &&
        other.phone == phone &&
        other.city == city &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        fullName.hashCode ^
        phone.hashCode ^
        city.hashCode ^
        createdAt.hashCode;
  }
}
