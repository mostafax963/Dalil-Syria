import 'package:dalil_syria/features/home/data/models/office_model.dart';
import 'package:dalil_syria/features/home/domain/repositories/home_repository.dart';

class GetOffices {
  final HomeRepository repo;

  GetOffices(this.repo);

  Future<List<OfficeModel>> call() {
    return repo.getOffices();
  }
}
