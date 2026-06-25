import 'package:dalil_syria/features/booking/domain/entities/booking_entity.dart';

abstract class BookingRepository {
  Future<void> createBooking({
    required String tripId,
    required String fullName,
    required String email,
    required String phone,
    required String date,
    required int guests,
  });

  Future<List<BookingEntity>> getBookings();
}
