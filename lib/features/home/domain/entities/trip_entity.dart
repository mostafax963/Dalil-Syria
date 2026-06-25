// ignore_for_file: public_member_api_docs, sort_constructors_first
class TripEntity {
  final String id;
  final String title;
  final String location;
  final num price;
  final int durationDays;
  final int durationNights;
  final String image;
  TripEntity({
    required this.id,
    required this.title,
    required this.location,
    required this.price,
    required this.durationDays,
    required this.durationNights,
    required this.image,
  });
}
