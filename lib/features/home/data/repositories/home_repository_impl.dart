import 'package:dalil_syria/core/errors/exceptions.dart';
import 'package:dalil_syria/core/network/network_info.dart';
import 'package:dalil_syria/features/home/data/models/banner_model.dart';
import 'package:dalil_syria/features/home/data/models/office_model.dart';
import 'package:dalil_syria/features/home/data/models/trip_model.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remote;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl(this.remote, this.networkInfo);

  @override
  Future<List<OfficeModel>> getOffices() async {
    if (!await networkInfo.isConnected) {
      throw ServerException("coniction_state".tr());
    }

    try {
      return await remote.getOffices();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException("home_failed_offices".tr());
    }
  }

  @override
  Future<List<TripModel>> getTrips() async {
    if (!await networkInfo.isConnected) {
      throw ServerException("coniction_state".tr());
    }

    try {
      return await remote.getTrips();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException("home_failed_trips".tr());
    }
  }

  @override
  Future<List<BannerModel>> getBanners() async {
    if (!await networkInfo.isConnected) {
      throw ServerException("coniction_state".tr());
    }

    try {
      return await remote.getBanners();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException("home_failed_offers".tr());
    }
  }
}
