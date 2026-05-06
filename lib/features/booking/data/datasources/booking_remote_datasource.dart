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
    final user = supabase.auth.currentUser;

    await supabase.from('bookings').insert({
      "user_id": user!.id,
      "trip_id": tripId,
      "full_name": fullName,
      "email": email,
      "phone": phone,
      "booking_date": date,
      "guests": guests,
      "status": "upcoming",
    });
  }

  Future<List> getBookings() async {
    final res = await supabase
        .from('bookings')
        .select('*, trips(title, image)')
        .order('created_at', ascending: false);

    return res;
  }
}
