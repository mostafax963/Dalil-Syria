import 'package:dalil_syria/core/errors/failures.dart';
import 'package:dalil_syria/core/providers/connection_provider.dart';
import 'package:dalil_syria/features/trips/data/datasources/trip_remote_data_source.dart';
import 'package:dalil_syria/features/trips/data/repositories/trip_repository_impl.dart';
import 'package:dalil_syria/features/trips/domain/entities/trip_details_entity.dart';
import 'package:dalil_syria/features/trips/domain/usecases/get_trip_details_usecase.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tripDataSourceProvider = Provider((ref) => TripRemoteDataSource());

final tripRepositoryProvider = Provider((ref) {
  return TripRepositoryImpl(
    ref.watch(tripDataSourceProvider),
    ref.watch(networkInfoProvider),
  );
});

final tripDetailsUseCaseProvider = Provider((ref) {
  return GetTripDetailsUseCase(ref.watch(tripRepositoryProvider));
});

final tripDetailsProvider = FutureProvider.family<TripDetailsEntity, String>((
  ref,
  id,
) async {
  try {
    return await ref.watch(tripDetailsUseCaseProvider)(id);
  } on Failure catch (e) {
    throw e.message;
  } catch (_) {
    throw 'error_generic'.tr();
  }
});
