abstract class BookingRepository {
  Future<void> createBooking(Map<String, dynamic> data);
  Future<List> getBookings();
}
