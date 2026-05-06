import 'package:dalil_syria/features/offices/domain/repositories/office_repository.dart';

class GetOfficeDetailsUseCase {
  final OfficeRepository repo;

  GetOfficeDetailsUseCase(this.repo);

  Future<Map<String, dynamic>> call(String id) async {
    final office = await repo.getOffice(id);
    final trips = await repo.getOfficeTrips(id);

    return {"office": office, "trips": trips};
  }
}
