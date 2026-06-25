// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dalil_syria/features/trips/domain/entities/trip_included_entity.dart';
import 'package:dalil_syria/features/trips/domain/entities/trip_timeline_entity.dart';

class TripDetailsEntity {
  final String id;
  final String title;
  final String image;
  final double price;
  final String location;
  final int durationDays;
  final int durationNights;
  final int maxPeople;
  final String description;
  final List<String> images;
  final List<TripTimelineEntity> timeline;
  final List<TripIncludedEntity> included;
  TripDetailsEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.location,
    required this.durationDays,
    required this.durationNights,
    required this.maxPeople,
    required this.description,
    required this.images,
    required this.timeline,
    required this.included,
  });
}
