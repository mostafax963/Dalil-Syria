import 'package:dalil_syria/core/config/app_constants.dart';
import 'package:dalil_syria/core/errors/exceptions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/trip_details_model.dart';

class TripRemoteDataSource {
  final _supabase = Supabase.instance.client;

  Future<TripDetailsModel> getTripDetails(String tripId) async {
    try {
      final results = await Future.wait<dynamic>([
        _supabase
            .from(AppConstants.tripsTable)
            .select()
            .eq('id', tripId)
            .single(),
        _supabase
            .from(AppConstants.tripImagesBucket)
            .select('sliders_image')
            .eq('trip_id', tripId),
        _supabase
            .from(AppConstants.tripTimelineTable)
            .select()
            .eq('trip_id', tripId)
            .order('day', ascending: true),
        _supabase
            .from(AppConstants.tripIncludedTable)
            .select()
            .eq('trip_id', tripId),
      ]);

      final trip = results[0] as Map<String, dynamic>;
      final imagesData = results[1] as List;
      final timelineData = results[2] as List;
      final includedData = results[3] as List;

      return TripDetailsModel.fromMap({
        ...trip,
        'images': imagesData.map((e) => e['sliders_image'] as String).toList(),
        'timeline': timelineData,
        'included': includedData,
      });
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException('error_generic'.tr());
    }
  }
}
