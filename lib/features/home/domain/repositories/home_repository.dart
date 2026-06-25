import 'package:dalil_syria/features/home/domain/entities/banner_entity.dart';
import 'package:dalil_syria/features/home/domain/entities/office_entity.dart';
import 'package:dalil_syria/features/home/domain/entities/trip_entity.dart';

abstract class HomeRepository {
  Future<List<OfficeEntity>> getOffices();

  Future<List<TripEntity>> getTrips();

  Future<List<BannerEntity>> getBanners();
}
