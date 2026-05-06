import 'package:dalil_syria/features/home/data/models/trip_model.dart';
import 'package:dalil_syria/features/home/domain/repositories/home_repository.dart';

class GetTrips {
  final HomeRepository repo;

  GetTrips(this.repo);

  Future<List<TripModel>> call() {
    return repo.getTrips();
  }
}
