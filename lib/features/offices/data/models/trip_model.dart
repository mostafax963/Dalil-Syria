// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dalil_syria/features/offices/domain/entities/office_trip_entity.dart';

class TripModel extends OfficeTripEntity {
  TripModel({
    required super.id,
    required super.title,
    required super.price,
    required super.durationDays,
    required super.durationNights,
    required super.image,
  });

  TripModel copyWith({
    String? id,
    String? title,
    double? price,
    int? durationDays,
    int? durationNights,
    String? image,
  }) {
    return TripModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      durationDays: durationDays ?? this.durationDays,
      durationNights: durationNights ?? this.durationNights,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'durationDays': durationDays,
      'durationNights': durationNights,
    };
  }

  factory TripModel.fromMap(Map<String, dynamic> map) {
    return TripModel(
      id: map['id'] as String,
      title: map['title'] as String,
      price: (map['price'] as num).toDouble(),
      durationDays: map['duration_days'] as int,
      durationNights: map['duration_nights'] as int,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TripModel.fromJson(String source) =>
      TripModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TripModel(id: $id, title: $title, price: $price, durationDays: $durationDays, durationNights: $durationNights)';
  }

  @override
  bool operator ==(covariant TripModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.price == price &&
        other.durationDays == durationDays &&
        other.durationNights == durationNights;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        durationDays.hashCode ^
        durationNights.hashCode;
  }
}
