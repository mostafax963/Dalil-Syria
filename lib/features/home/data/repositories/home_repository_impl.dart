import 'package:dalil_syria/features/home/data/models/banner_model.dart';

import '../datasources/home_remote_data_source.dart';
import '../models/office_model.dart';
import '../models/trip_model.dart';
import '../../domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remote;

  HomeRepositoryImpl(this.remote);

  @override
  Future<List<OfficeModel>> getOffices() async {
    final data = await remote.getOffices();
    return data.map((e) => OfficeModel.fromMap(e)).toList();
  }

  @override
  Future<List<TripModel>> getTrips() async {
    final data = await remote.getTrips();
    return data.map((e) => TripModel.fromMap(e)).toList();
  }

  Future<List<BannerModel>> getBanners() async {
    final data = await remote.getBanners();
    return data.map((e) => BannerModel.fromMap(e)).toList();
  }
}
