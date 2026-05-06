// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:dalil_syria/features/trips/data/models/trip_included_model.dart';
import 'package:dalil_syria/features/trips/data/models/trip_timeline_model.dart';

class TripDetailsModel {
  final String id;
  final String title;
  final String image;
  final double price;
  final String location;
  final int duration_days;
  final int duration_nights;
  final int maxPeople;
  final String description;

  final List<String> images;
  final List<TripTimelineModel> timeline;
  final List<TripIncludedModel> included;
  TripDetailsModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.location,
    required this.duration_days,
    required this.duration_nights,
    required this.maxPeople,
    required this.description,
    required this.images,
    required this.timeline,
    required this.included,
  });

  TripDetailsModel copyWith({
    String? id,
    String? title,
    String? image,
    double? price,
    String? location,
    int? duration_days,
    int? duration_nights,
    int? maxPeople,
    String? description,
    List<String>? images,
    List<TripTimelineModel>? timeline,
    List<TripIncludedModel>? included,
  }) {
    return TripDetailsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      price: price ?? this.price,
      location: location ?? this.location,
      duration_days: duration_days ?? this.duration_days,
      duration_nights: duration_nights ?? this.duration_nights,
      maxPeople: maxPeople ?? this.maxPeople,
      description: description ?? this.description,
      images: images ?? this.images,
      timeline: timeline ?? this.timeline,
      included: included ?? this.included,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'image': image,
      'price': price,
      'location': location,
      'duration_days': duration_days,
      'duration_nights': duration_nights,
      'maxPeople': maxPeople,
      'description': description,
      'images': images,
      'timeline': timeline.map((x) => x.toMap()).toList(),
      'included': included.map((x) => x.toMap()).toList(),
    };
  }

  factory TripDetailsModel.fromMap(Map<String, dynamic> map) {
    return TripDetailsModel(
      timeline: List<TripTimelineModel>.from(
        (map['timeline'] as List<Map<String, dynamic>>).map<TripTimelineModel>(
          (x) => TripTimelineModel.fromMap(x),
        ),
      ),
      included: List<TripIncludedModel>.from(
        (map['included'] as List<Map<String, dynamic>>).map<TripIncludedModel>(
          (x) => TripIncludedModel.fromMap(x),
        ),
      ),
      id: map['id'] as String,
      title: map['title'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      location: map['location'] as String,
      duration_days: map['duration_days'] as int,
      duration_nights: map['duration_nights'] as int,
      maxPeople: map['maxPeople'] as int,
      description: map['description'] as String,
      images: List<String>.from((map['images'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory TripDetailsModel.fromJson(String source) =>
      TripDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TripDetailsModel(id: $id, title: $title, image: $image, price: $price, location: $location, duration_days: $duration_days, duration_nights: $duration_nights, maxPeople: $maxPeople, description: $description, images: $images, timeline: $timeline, included: $included)';
  }

  @override
  bool operator ==(covariant TripDetailsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.image == image &&
        other.price == price &&
        other.location == location &&
        other.duration_days == duration_days &&
        other.duration_nights == duration_nights &&
        other.maxPeople == maxPeople &&
        other.description == description &&
        listEquals(other.images, images) &&
        listEquals(other.timeline, timeline) &&
        listEquals(other.included, included);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        image.hashCode ^
        price.hashCode ^
        location.hashCode ^
        duration_days.hashCode ^
        duration_nights.hashCode ^
        maxPeople.hashCode ^
        description.hashCode ^
        images.hashCode ^
        timeline.hashCode ^
        included.hashCode;
  }
}
