import 'package:dalil_syria/features/attractions/domain/entities/attraction_entity.dart';
import 'package:dalil_syria/features/attractions/domain/entities/highlight_entity.dart';

import 'package:dalil_syria/features/home/domain/entities/trip_entity.dart';

class AttractionDetailsEntity {
  final AttractionEntity attraction;
  final List<HighlightEntity> highlights;
  final List<TripEntity> trips;

  const AttractionDetailsEntity({
    required this.attraction,
    required this.highlights,
    required this.trips,
  });
}
