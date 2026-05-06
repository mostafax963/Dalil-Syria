// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OfficeModel {
  final String id;
  final String name;
  final String image;
  final double rating;
  final int reviewsCount;
  final String location;
  final String about;
  final String phone;
  final String email;
  final String website;
  OfficeModel({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.reviewsCount,
    required this.location,
    required this.about,
    required this.phone,
    required this.email,
    required this.website,
  });

  OfficeModel copyWith({
    String? id,
    String? name,
    String? image,
    double? rating,
    int? reviewsCount,
    String? location,
    String? about,
    String? phone,
    String? email,
    String? website,
  }) {
    return OfficeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      location: location ?? this.location,
      about: about ?? this.about,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      website: website ?? this.website,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'location': location,
      'about': about,
      'phone': phone,
      'email': email,
      'website': website,
    };
  }

  factory OfficeModel.fromMap(Map<String, dynamic> map) {
    return OfficeModel(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      rating: (map['rating'] as num).toDouble(),
      reviewsCount: (map['reviews_count'] as num).toInt(),
      location: map['location'] as String,
      about: map['about'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      website: map['website'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfficeModel.fromJson(String source) =>
      OfficeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OfficeModel(id: $id, name: $name, image: $image, rating: $rating, reviewsCount: $reviewsCount, location: $location, about: $about, phone: $phone, email: $email, website: $website)';
  }

  @override
  bool operator ==(covariant OfficeModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.image == image &&
        other.rating == rating &&
        other.reviewsCount == reviewsCount &&
        other.location == location &&
        other.about == about &&
        other.phone == phone &&
        other.email == email &&
        other.website == website;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        rating.hashCode ^
        reviewsCount.hashCode ^
        location.hashCode ^
        about.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        website.hashCode;
  }
}
