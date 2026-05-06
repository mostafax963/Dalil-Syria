import '../datasources/booking_remote_datasource.dart';
import '../../domain/repositories/booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remote;

  BookingRepositoryImpl(this.remote);

  @override
  Future<void> createBooking(Map<String, dynamic> data) {
    return remote.createBooking(
      tripId: data['tripId'],
      fullName: data['fullName'],
      email: data['email'],
      phone: data['phone'],
      date: data['date'],
      guests: data['guests'],
    );
  }

  @override
  Future<List> getBookings() {
    return remote.getBookings();
  }
}
