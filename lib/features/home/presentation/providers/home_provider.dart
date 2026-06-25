import 'package:dalil_syria/core/errors/exceptions.dart';
import 'package:dalil_syria/core/providers/connection_provider.dart';
import 'package:dalil_syria/features/home/domain/entities/banner_entity.dart';
import 'package:dalil_syria/features/home/domain/entities/office_entity.dart';
import 'package:dalil_syria/features/home/domain/entities/trip_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/home_remote_data_source.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecases/get_banners.dart';
import '../../domain/usecases/get_offices.dart';
import '../../domain/usecases/get_trips.dart';

final homeDataSourceProvider = Provider<HomeRemoteDataSource>((ref) {
  return HomeRemoteDataSource();
});

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl(
    ref.read(homeDataSourceProvider),
    ref.read(networkInfoProvider),
  );
});

final getOfficesProvider = Provider<GetOffices>((ref) {
  return GetOffices(ref.read(homeRepositoryProvider));
});

final getTripsProvider = Provider<GetTrips>((ref) {
  return GetTrips(ref.read(homeRepositoryProvider));
});

final getBannersProvider = Provider<GetBanners>((ref) {
  return GetBanners(ref.read(homeRepositoryProvider));
});

final officesProvider = FutureProvider<List<OfficeEntity>>((ref) async {
  try {
    return await ref.read(getOfficesProvider).call();
  } on ServerException catch (e) {
    throw e.message;
  } catch (e) {
    throw "error_generic".tr();
  }
});

final tripsProvider = FutureProvider<List<TripEntity>>((ref) async {
  try {
    return await ref.read(getTripsProvider).call();
  } on ServerException catch (e) {
    throw e.message;
  } catch (e) {
    throw "error_generic".tr();
  }
});

final bannersProvider = FutureProvider<List<BannerEntity>>((ref) async {
  try {
    return await ref.read(getBannersProvider).call();
  } on ServerException catch (e) {
    throw e.message;
  } catch (e) {
    throw "error_generic".tr();
  }
});
