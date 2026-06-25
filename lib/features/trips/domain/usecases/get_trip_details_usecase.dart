import '../entities/trip_details_entity.dart';
import '../repositories/trip_repository.dart';

class GetTripDetailsUseCase {
  final TripRepository repository;

  GetTripDetailsUseCase(this.repository);

  Future<TripDetailsEntity> call(String id) {
    return repository.getTripDetails(id);
  }
}
