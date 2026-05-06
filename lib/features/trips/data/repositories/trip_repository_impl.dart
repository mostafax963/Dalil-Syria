import 'package:dalil_syria/features/trips/data/datasources/trip_remote_data_source.dart';
import 'package:dalil_syria/features/trips/data/models/trip_details_model.dart';
import 'package:dalil_syria/features/trips/domain/repositories/trip_repository.dart';

class TripRepositoryImpl implements TripRepository {
  final TripRemoteDataSource remote;

  TripRepositoryImpl(this.remote);

  @override
  Future<TripDetailsModel> getTripDetails(String id) {
    return remote.getTripDetails(id);
  }
}
