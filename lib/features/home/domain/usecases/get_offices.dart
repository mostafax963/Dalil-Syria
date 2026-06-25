import 'package:dalil_syria/features/home/domain/entities/office_entity.dart';
import 'package:dalil_syria/features/home/domain/repositories/home_repository.dart';

class GetOffices {
  final HomeRepository repo;

  GetOffices(this.repo);

  Future<List<OfficeEntity>> call() {
    return repo.getOffices();
  }
}
