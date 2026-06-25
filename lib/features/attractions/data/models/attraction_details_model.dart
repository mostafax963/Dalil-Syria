import 'package:dalil_syria/features/attractions/data/models/highlights_model.dart';
import 'package:dalil_syria/features/attractions/domain/entities/attraction_details_entity.dart';

import 'package:dalil_syria/features/attractions/data/models/attraction_model.dart';
import 'package:dalil_syria/features/home/data/models/trip_model.dart';

class AttractionDetailsModel extends AttractionDetailsEntity {
  const AttractionDetailsModel({
    required super.attraction,
    required super.highlights,
    required super.trips,
  });

  factory AttractionDetailsModel.fromData({
    required AttractionModel attraction,
    required List<HighlightsModel> highlights,
    required List<TripModel> trips,
  }) {
    return AttractionDetailsModel(
      attraction: attraction,
      highlights: highlights,
      trips: trips,
    );
  }
}
