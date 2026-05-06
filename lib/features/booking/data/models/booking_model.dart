// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BookingModel {
  final String id;
  final String tripId;
  final String title;
  final String image;
  final String date;
  final String status;
  BookingModel({
    required this.id,
    required this.tripId,
    required this.title,
    required this.image,
    required this.date,
    required this.status,
  });

  BookingModel copyWith({
    String? id,
    String? tripId,
    String? title,
    String? image,
    String? date,
    String? status,
  }) {
    return BookingModel(
      id: id ?? this.id,
      tripId: tripId ?? this.tripId,
      title: title ?? this.title,
      image: image ?? this.image,
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tripId': tripId,
      'title': title,
      'image': image,
      'date': date,
      'status': status,
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    final trip = map['trips'] as Map<String, dynamic>? ?? {};
    return BookingModel(
      id: map['id'] as String,
      tripId: map['trip_id'] as String,
      title: trip['title'] as String? ?? '',
      image: trip['image'] as String? ?? '',
      date: map['booking_date'] as String? ?? '',
      status: map['status'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingModel.fromJson(String source) =>
      BookingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookingModel(id: $id, tripId: $tripId, title: $title, image: $image, date: $date, status: $status)';
  }

  @override
  bool operator ==(covariant BookingModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.tripId == tripId &&
        other.title == title &&
        other.image == image &&
        other.date == date &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        tripId.hashCode ^
        title.hashCode ^
        image.hashCode ^
        date.hashCode ^
        status.hashCode;
  }
}
