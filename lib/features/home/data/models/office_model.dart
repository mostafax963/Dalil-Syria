// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OfficeModel {
  final String id;
  final String name;
  final String image;
  final int reviews_count;
  final double rating;
  OfficeModel({
    required this.id,
    required this.name,
    required this.image,
    required this.reviews_count,
    required this.rating,
  });

  OfficeModel copyWith({
    String? id,
    String? name,
    String? image,
    int? reviews_count,
    double? rating,
  }) {
    return OfficeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      reviews_count: reviews_count ?? this.reviews_count,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'reviews_count': reviews_count,
      'rating': rating,
    };
  }

  factory OfficeModel.fromMap(Map<String, dynamic> map) {
    return OfficeModel(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      reviews_count: map['reviews_count'] as int,
      rating: (map['rating'] as num).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory OfficeModel.fromJson(String source) =>
      OfficeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OfficeModel(id: $id, name: $name, image: $image, reviews_count: $reviews_count, rating: $rating)';
  }

  @override
  bool operator ==(covariant OfficeModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.image == image &&
        other.reviews_count == reviews_count &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        reviews_count.hashCode ^
        rating.hashCode;
  }
}
