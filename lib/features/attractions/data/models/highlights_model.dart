// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HighlightsModel {
  final String title;
  HighlightsModel({required this.title});

  HighlightsModel copyWith({String? title}) {
    return HighlightsModel(title: title ?? this.title);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'title': title};
  }

  factory HighlightsModel.fromMap(Map<String, dynamic> map) {
    return HighlightsModel(title: map['title'] as String);
  }

  String toJson() => json.encode(toMap());

  factory HighlightsModel.fromJson(String source) =>
      HighlightsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HighlightsModel(title: $title)';

  @override
  bool operator ==(covariant HighlightsModel other) {
    if (identical(this, other)) return true;

    return other.title == title;
  }

  @override
  int get hashCode => title.hashCode;
}
