// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TripModel {
  final String id;
  final String title;
  final String location;
  final num price;
  final int duration_days;
  final int duration_nights;
  final String image;
  TripModel({
    required this.id,
    required this.title,
    required this.location,
    required this.price,
    required this.duration_days,
    required this.duration_nights,
    required this.image,
  });

  TripModel copyWith({
    String? title,
    String? location,
    num? price,
    int? duration_days,
    int? duration_nights,
    String? image,
  }) {
    return TripModel(
      id: id,
      title: title ?? this.title,
      location: location ?? this.location,
      price: price ?? this.price,
      duration_days: duration_days ?? this.duration_days,
      duration_nights: duration_nights ?? this.duration_nights,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'location': location,
      'price': price,
      'duration_days': duration_days,
      'duration_nights': duration_nights,
      'image': image,
    };
  }

  factory TripModel.fromMap(Map<String, dynamic> map) {
    return TripModel(
      id: map['id'] as String,
      title: map['title'] as String,
      location: map['location'] as String,
      price: map['price'] as num,
      duration_days: map['duration_days'] as int,
      duration_nights: map['duration_nights'] as int,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TripModel.fromJson(String source) =>
      TripModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TripModel(title: $title, location: $location, price: $price, duration_days: $duration_days, duration_nights: $duration_nights, image: $image)';
  }

  @override
  bool operator ==(covariant TripModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.location == location &&
        other.price == price &&
        other.duration_days == duration_days &&
        other.duration_nights == duration_nights &&
        other.image == image;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        location.hashCode ^
        price.hashCode ^
        duration_days.hashCode ^
        duration_nights.hashCode ^
        image.hashCode;
  }
}
