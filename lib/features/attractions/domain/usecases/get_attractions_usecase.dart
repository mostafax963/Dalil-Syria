import 'package:dalil_syria/features/attractions/domain/entities/attraction_entity.dart';
import 'package:dalil_syria/features/attractions/domain/repositories/attraction_repository.dart';

class GetAttractionsUseCase {
  final AttractionRepository repository;

  GetAttractionsUseCase(this.repository);

  Future<List<AttractionEntity>> call() async {
    return repository.getAttractions();
  }
}
