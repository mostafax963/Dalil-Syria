import 'package:dalil_syria/features/attractions/domain/entities/attraction_details_entity.dart';
import 'package:dalil_syria/features/attractions/domain/repositories/attraction_repository.dart';

class GetAttractionDetailsUseCase {
  final AttractionRepository repository;

  GetAttractionDetailsUseCase(this.repository);

  Future<AttractionDetailsEntity> call(String id) async {
    return repository.getAttractionDetails(id);
  }
}
