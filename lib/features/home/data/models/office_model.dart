import 'dart:convert';

import 'package:dalil_syria/features/home/domain/entities/office_entity.dart';

class OfficeModel extends OfficeEntity {
  OfficeModel({
    required super.id,
    required super.name,
    required super.image,
    required super.reviewsCount,
    required super.rating,
  });

  OfficeModel copyWith({
    String? id,
    String? name,
    String? image,
    int? reviewsCount,
    double? rating,
  }) {
    return OfficeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'reviews_count': reviewsCount,
      'rating': rating,
    };
  }

  factory OfficeModel.fromMap(Map<String, dynamic> map) {
    return OfficeModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      reviewsCount: map['reviews_count'] ?? 0,
      rating: (map['rating'] ?? 0).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory OfficeModel.fromJson(String source) =>
      OfficeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OfficeModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(covariant OfficeModel other) {
    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
