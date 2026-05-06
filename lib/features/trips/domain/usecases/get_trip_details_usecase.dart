import 'package:dalil_syria/features/trips/data/models/trip_details_model.dart';
import 'package:dalil_syria/features/trips/domain/repositories/trip_repository.dart';

class GetTripDetailsUseCase {
  final TripRepository repo;

  GetTripDetailsUseCase(this.repo);

  Future<TripDetailsModel> call(String id) {
    return repo.getTripDetails(id);
  }
}
