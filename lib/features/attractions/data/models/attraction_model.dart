// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AttractionModel {
  final String id;
  final String title;
  final String location;
  final String description;
  final String image;
  final String visitDuration;
  final String bestTime;
  AttractionModel({
    required this.id,
    required this.title,
    required this.location,
    required this.description,
    required this.image,
    required this.visitDuration,
    required this.bestTime,
  });

  AttractionModel copyWith({
    String? id,
    String? title,
    String? location,
    String? description,
    String? image,
    String? visitDuration,
    String? bestTime,
  }) {
    return AttractionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      location: location ?? this.location,
      description: description ?? this.description,
      image: image ?? this.image,
      visitDuration: visitDuration ?? this.visitDuration,
      bestTime: bestTime ?? this.bestTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'location': location,
      'description': description,
      'image': image,
      'visitDuration': visitDuration,
      'bestTime': bestTime,
    };
  }

  factory AttractionModel.fromMap(Map<String, dynamic> map) {
    return AttractionModel(
      id: map['id'] as String,
      title: map['title'] as String,
      location: map['location'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      visitDuration: map['visit_duration'] as String,
      bestTime: map['best_time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttractionModel.fromJson(String source) =>
      AttractionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AttractionModel(id: $id, title: $title, location: $location, description: $description, image: $image, visitDuration: $visitDuration, bestTime: $bestTime)';
  }

  @override
  bool operator ==(covariant AttractionModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.location == location &&
        other.description == description &&
        other.image == image &&
        other.visitDuration == visitDuration &&
        other.bestTime == bestTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        location.hashCode ^
        description.hashCode ^
        image.hashCode ^
        visitDuration.hashCode ^
        bestTime.hashCode;
  }
}
