import 'package:dalil_syria/core/config/app_constants.dart';
import 'package:dalil_syria/core/errors/exceptions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OfficeRemoteDataSource {
  final supabase = Supabase.instance.client;

  Future<Map<String, dynamic>> getOffice(String officeId) async {
    try {
      final data = await supabase
          .from(AppConstants.officesTable)
          .select()
          .eq('id', officeId)
          .single()
          .timeout(const Duration(seconds: 10));

      return data;
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException("office_error".tr());
    }
  }

  Future<List<Map<String, dynamic>>> getOfficeTrips(String officeId) async {
    try {
      final data = await supabase
          .from(AppConstants.tripsTable)
          .select()
          .eq('office_id', officeId)
          .timeout(const Duration(seconds: 10));

      return List<Map<String, dynamic>>.from(data);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException("office_error_trips".tr());
    }
  }
}
