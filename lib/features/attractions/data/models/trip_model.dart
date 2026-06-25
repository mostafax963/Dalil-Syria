import 'dart:convert';

import 'package:dalil_syria/features/attractions/domain/entities/trip_entity.dart';

class TripModel extends TripEntity {
  TripModel({
    required super.id,
    required super.title,
    required super.location,
    required super.price,
    required super.durationDays,
    required super.durationNights,
    required super.image,
  });

  TripModel copyWith({
    String? id,
    String? title,
    String? location,
    num? price,
    int? durationDays,
    int? durationNights,
    String? image,
  }) {
    return TripModel(
      id: id ?? this.id,
      title: title ?? this.title,
      location: location ?? this.location,
      price: price ?? this.price,
      durationDays: durationDays ?? this.durationDays,
      durationNights: durationNights ?? this.durationNights,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'location': location,
      'price': price,
      'duration_days': durationDays,
      'duration_nights': durationNights,
      'image': image,
    };
  }

  factory TripModel.fromMap(Map<String, dynamic> map) {
    return TripModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      location: map['location'] ?? '',
      price: map['price'] ?? 0,
      durationDays: map['duration_days'] ?? 0,
      durationNights: map['duration_nights'] ?? 0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TripModel.fromJson(String source) =>
      TripModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TripModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(covariant TripModel other) {
    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
