// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dalil_syria/features/home/domain/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  BannerModel({
    required super.image,
    required super.title,
    required super.description,
  });

  BannerModel copyWith({String? image, String? title, String? description}) {
    return BannerModel(
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'title': title,
      'description': description,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      image: map['image'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerModel.fromJson(String source) =>
      BannerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BannerModel(image: $image, title: $title, description: $description)';

  @override
  bool operator ==(covariant BannerModel other) {
    if (identical(this, other)) return true;

    return other.image == image &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode => image.hashCode ^ title.hashCode ^ description.hashCode;
}
