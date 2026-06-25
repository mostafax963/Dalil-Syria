import 'package:dalil_syria/features/trips/domain/entities/trip_details_entity.dart';

abstract class TripRepository {
  Future<TripDetailsEntity> getTripDetails(String id);
}
