import '../entities/office_entity.dart';
import '../entities/office_trip_entity.dart';

abstract class OfficeRepository {
  Future<OfficeEntity> getOffice(String id);

  Future<List<OfficeTripEntity>> getOfficeTrips(String id);
}
