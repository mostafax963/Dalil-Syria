import 'dart:convert';
import 'package:dalil_syria/features/trips/domain/entities/trip_details_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:dalil_syria/features/trips/data/models/trip_included_model.dart';
import 'package:dalil_syria/features/trips/data/models/trip_timeline_model.dart';

class TripDetailsModel extends TripDetailsEntity {
  TripDetailsModel({
    required super.id,
    required super.title,
    required super.image,
    required super.price,
    required super.location,
    required super.durationDays,
    required super.durationNights,
    required super.maxPeople,
    required super.description,
    required super.images,
    required super.timeline,
    required super.included,
  });

  TripDetailsModel copyWith({
    String? id,
    String? title,
    String? image,
    double? price,
    String? location,
    int? durationDays, // ✅ كان duration_days
    int? durationNights, // ✅ كان duration_nights
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
      durationDays: durationDays ?? this.durationDays, // ✅ إصلاح
      durationNights: durationNights ?? this.durationNights, // ✅ إصلاح
      maxPeople: maxPeople ?? this.maxPeople,
      description: description ?? this.description,
      images: images ?? this.images,
      timeline: timeline ?? this.timeline,
      included: included ?? this.included,
    );
  }

  factory TripDetailsModel.fromMap(Map<String, dynamic> map) {
    return TripDetailsModel(
      id: map['id'] as String,
      title: map['title'] as String,
      image: map['image'] as String? ?? '',
      price: (map['price'] as num).toDouble(), // ✅ إصلاح
      location: map['location'] as String? ?? '',
      durationDays: map['duration_days'] as int, // ✅ snake_case
      durationNights: map['duration_nights'] as int, // ✅ snake_case
      maxPeople: map['max_people'] as int, // ✅ snake_case
      description: map['description'] as String? ?? '',
      images: List<String>.from(map['images'] as List), // ✅ إصلاح
      timeline: List<TripTimelineModel>.from(
        (map['timeline'] as List).map((x) => TripTimelineModel.fromMap(x)),
      ),
      included: List<TripIncludedModel>.from(
        (map['included'] as List).map((x) => TripIncludedModel.fromMap(x)),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'price': price,
      'location': location,
      'duration_days': durationDays,
      'duration_nights': durationNights,
      'max_people': maxPeople,
      'description': description,
      'images': images,
      'timeline': (timeline as List<TripTimelineModel>)
          .map((x) => x.toMap())
          .toList(),
      'included': (included as List<TripIncludedModel>)
          .map((x) => x.toMap())
          .toList(),
    };
  }

  String toJson() => json.encode(toMap());

  factory TripDetailsModel.fromJson(String source) =>
      TripDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant TripDetailsModel other) {
    if (identical(this, other)) return true;
    return other.id == id &&
        other.title == title &&
        other.price == price &&
        listEquals(other.images, images) &&
        listEquals(other.timeline, timeline) &&
        listEquals(other.included, included);
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ price.hashCode;
}
