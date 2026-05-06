import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/home_remote_data_source.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/usecases/get_offices.dart';
import '../../domain/usecases/get_trips.dart';

final homeDataSourceProvider = Provider((ref) {
  return HomeRemoteDataSource();
});

final homeRepositoryProvider = Provider((ref) {
  return HomeRepositoryImpl(ref.read(homeDataSourceProvider));
});

final getOfficesProvider = Provider((ref) {
  return GetOffices(ref.read(homeRepositoryProvider));
});

final getTripsProvider = Provider((ref) {
  return GetTrips(ref.read(homeRepositoryProvider));
});

/// 👇 Async Providers
final officesProvider = FutureProvider((ref) async {
  return ref.read(getOfficesProvider).call();
});

final tripsProvider = FutureProvider((ref) async {
  return ref.read(getTripsProvider).call();
});
final bannersProvider = FutureProvider((ref) async {
  return ref.read(homeRepositoryProvider).getBanners();
});
