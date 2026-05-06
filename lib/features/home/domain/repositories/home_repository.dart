import 'package:dalil_syria/features/home/data/models/office_model.dart';
import 'package:dalil_syria/features/home/data/models/trip_model.dart';

abstract class HomeRepository {
  Future<List<OfficeModel>> getOffices();
  Future<List<TripModel>> getTrips();
}
