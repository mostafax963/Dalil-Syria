// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TripTimelineModel {
  final int day;
  final String title;
  final String description;
  TripTimelineModel({
    required this.day,
    required this.title,
    required this.description,
  });

  TripTimelineModel copyWith({int? day, String? title, String? description}) {
    return TripTimelineModel(
      day: day ?? this.day,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day,
      'title': title,
      'description': description,
    };
  }

  factory TripTimelineModel.fromMap(Map<String, dynamic> map) {
    return TripTimelineModel(
      day: map['day'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TripTimelineModel.fromJson(String source) =>
      TripTimelineModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TripTimelineModel(day: $day, title: $title, description: $description)';

  @override
  bool operator ==(covariant TripTimelineModel other) {
    if (identical(this, other)) return true;

    return other.day == day &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode => day.hashCode ^ title.hashCode ^ description.hashCode;
}
