import 'package:dalil_syria/features/trips/data/models/trip_details_model.dart';

abstract class TripRepository {
  Future<TripDetailsModel> getTripDetails(String id);
}
