import '../../data/models/office_model.dart';
import '../../data/models/trip_model.dart';

abstract class OfficeRepository {
  Future<OfficeModel> getOffice(String id);
  Future<List<TripModel>> getOfficeTrips(String id);
}
