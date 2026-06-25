import 'dart:async';

import 'package:dalil_syria/core/config/app_constants.dart';
import 'package:dalil_syria/core/errors/exceptions.dart';
import 'package:dalil_syria/features/attractions/data/models/attraction_details_model.dart';
import 'package:dalil_syria/features/attractions/data/models/attraction_model.dart';
import 'package:dalil_syria/features/attractions/data/models/highlights_model.dart';
import 'package:dalil_syria/features/home/data/models/trip_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AttractionRemoteDataSource {
  Future<List<AttractionModel>> getAttractions();

  Future<AttractionDetailsModel> getAttractionDetails(String id);
}

class AttractionRemoteDataSourceImpl implements AttractionRemoteDataSource {
  final SupabaseClient supabase;

  AttractionRemoteDataSourceImpl(this.supabase);

  @override
  Future<List<AttractionModel>> getAttractions() async {
    try {
      final data = await supabase
          .from(AppConstants.attractionsTable)
          .select()
          .timeout(const Duration(seconds: 10));

      return (data as List).map((e) => AttractionModel.fromMap(e)).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } on TimeoutException {
      throw ServerException("timeout_error".tr());
    } catch (e) {
      throw ServerException("attractions_error".tr());
    }
  }

  @override
  Future<AttractionDetailsModel> getAttractionDetails(String id) async {
    try {
      final attractionData = await supabase
          .from(AppConstants.attractionsTable)
          .select()
          .eq('id', id)
          .single()
          .timeout(const Duration(seconds: 10));

      final highlightsData = await supabase
          .from(AppConstants.attractionHighlightsTable)
          .select()
          .eq('attraction_id', id);

      final tripsData = await supabase
          .from(AppConstants.tripsTable)
          .select()
          .eq('attraction_id', id);

      return AttractionDetailsModel.fromData(
        attraction: AttractionModel.fromMap(attractionData),

        highlights: (highlightsData as List)
            .map((e) => HighlightsModel.fromMap(e))
            .toList(),

        trips: (tripsData as List).map((e) => TripModel.fromMap(e)).toList(),
      );
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } on TimeoutException {
      throw ServerException("timeout_error".tr());
    } catch (e) {
      throw ServerException("error_attraction_details".tr());
    }
  }
}
