class BookingEntity {
  final String id;
  final String tripId;
  final String title;
  final String image;
  final String date;
  final String status;

  const BookingEntity({
    required this.id,
    required this.tripId,
    required this.title,
    required this.image,
    required this.date,
    required this.status,
  });
}
