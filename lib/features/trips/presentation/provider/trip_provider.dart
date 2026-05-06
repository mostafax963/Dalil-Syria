import 'package:dalil_syria/features/trips/data/datasources/trip_remote_data_source.dart';
import 'package:dalil_syria/features/trips/data/models/trip_details_model.dart';
import 'package:dalil_syria/features/trips/data/repositories/trip_repository_impl.dart';
import 'package:dalil_syria/features/trips/domain/usecases/get_trip_details_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tripDataSourceProvider = Provider((ref) {
  return TripRemoteDataSource();
});

final tripRepositoryProvider = Provider((ref) {
  return TripRepositoryImpl(ref.read(tripDataSourceProvider));
});

final tripDetailsUseCaseProvider = Provider((ref) {
  return GetTripDetailsUseCase(ref.read(tripRepositoryProvider));
});

final tripDetailsProvider = FutureProvider.family<TripDetailsModel, String>((
  ref,
  id,
) async {
  final usecase = ref.read(tripDetailsUseCaseProvider);
  return await usecase(id);
});
