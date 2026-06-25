import 'package:dalil_syria/features/home/domain/entities/trip_entity.dart';
import 'package:dalil_syria/features/home/domain/repositories/home_repository.dart';

class GetTrips {
  final HomeRepository repo;

  GetTrips(this.repo);

  Future<List<TripEntity>> call() {
    return repo.getTrips();
  }
}
