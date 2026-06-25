import 'package:dalil_syria/core/config/app_constants.dart';
import 'package:dalil_syria/core/errors/exceptions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookingRemoteDataSource {
  final supabase = Supabase.instance.client;

  Future<void> createBooking({
    required String tripId,
    required String fullName,
    required String email,
    required String phone,
    required String date,
    required int guests,
  }) async {
    try {
      final user = supabase.auth.currentUser;

      if (user == null) {
        throw ServerException("error_login_required".tr());
      }

      await supabase.from(AppConstants.bookingsTable).insert({
        "user_id": user.id,
        "trip_id": tripId,
        "full_name": fullName,
        "email": email,
        "phone": phone,
        "booking_date": date,
        "guests": guests,
        "status": "upcoming",
      });
    } catch (e) {
      throw ServerException("error_booking_create".tr());
    }
  }

  Future<List> getBookings() async {
    try {
      final res = await supabase
          .from(AppConstants.bookingsTable)
          .select('*, trips(title, image)')
          .order('created_at', ascending: false);

      return res;
    } catch (e) {
      throw ServerException("error_bookings_load".tr());
    }
  }
}
