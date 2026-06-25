import 'package:dalil_syria/core/errors/failures.dart';

import '../entities/office_details_entity.dart';
import '../repositories/office_repository.dart';

class GetOfficeDetailsUseCase {
  final OfficeRepository repo;

  GetOfficeDetailsUseCase(this.repo);

  Future<OfficeDetailsEntity> call(String id) async {
    try {
      final office = await repo.getOffice(id);

      final trips = await repo.getOfficeTrips(id);

      return OfficeDetailsEntity(office: office, trips: trips);
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    }
  }
}
