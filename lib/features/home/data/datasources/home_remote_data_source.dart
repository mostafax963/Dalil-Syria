import 'package:dalil_syria/core/config/app_constants.dart';
import 'package:dalil_syria/core/errors/exceptions.dart';
import 'package:dalil_syria/features/home/data/models/banner_model.dart';
import 'package:dalil_syria/features/home/data/models/office_model.dart';
import 'package:dalil_syria/features/home/data/models/trip_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRemoteDataSource {
  final supabase = Supabase.instance.client;

  Future<List<OfficeModel>> getOffices() async {
    try {
      final response = await supabase
          .from(AppConstants.officesTable)
          .select()
          .timeout(const Duration(seconds: 10));

      return response.map<OfficeModel>((e) => OfficeModel.fromMap(e)).toList();
    } catch (e) {
      throw ServerException("home_failed_offices".tr());
    }
  }

  Future<List<TripModel>> getTrips() async {
    try {
      final response = await supabase
          .from(AppConstants.tripsTable)
          .select()
          .timeout(const Duration(seconds: 10));

      return response.map<TripModel>((e) => TripModel.fromMap(e)).toList();
    } catch (e) {
      throw ServerException("home_failed_trips".tr());
    }
  }

  Future<List<BannerModel>> getBanners() async {
    try {
      final response = await supabase
          .from(AppConstants.bannersTable)
          .select()
          .timeout(const Duration(seconds: 10));

      return response.map<BannerModel>((e) => BannerModel.fromMap(e)).toList();
    } catch (e) {
      throw ServerException("home_failed_offers".tr());
    }
  }
}
