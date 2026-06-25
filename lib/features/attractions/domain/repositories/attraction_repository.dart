import 'package:dalil_syria/features/attractions/domain/entities/attraction_details_entity.dart';
import 'package:dalil_syria/features/attractions/domain/entities/attraction_entity.dart';

abstract class AttractionRepository {
  Future<List<AttractionEntity>> getAttractions();

  Future<AttractionDetailsEntity> getAttractionDetails(String id);
}
