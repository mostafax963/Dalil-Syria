// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TripIncludedModel {
  final String title;
  TripIncludedModel({required this.title});

  TripIncludedModel copyWith({String? title}) {
    return TripIncludedModel(title: title ?? this.title);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'title': title};
  }

  factory TripIncludedModel.fromMap(Map<String, dynamic> map) {
    return TripIncludedModel(title: map['title'] as String);
  }

  String toJson() => json.encode(toMap());

  factory TripIncludedModel.fromJson(String source) =>
      TripIncludedModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TripIncludedModel(title: $title)';

  @override
  bool operator ==(covariant TripIncludedModel other) {
    if (identical(this, other)) return true;

    return other.title == title;
  }

  @override
  int get hashCode => title.hashCode;
}
