import '../../domain/repositories/office_repository.dart';
import '../datasources/office_remote_data_source.dart';
import '../models/office_model.dart';
import '../models/trip_model.dart';

class OfficeRepositoryImpl implements OfficeRepository {
  final OfficeRemoteDataSource remote;

  OfficeRepositoryImpl(this.remote);
  @override
  Future<OfficeModel> getOffice(String id) {
    return remote.getOffice(id);
  }

  @override
  Future<List<TripModel>> getOfficeTrips(String id) {
    return remote.getOfficeTrips(id);
  }
}
