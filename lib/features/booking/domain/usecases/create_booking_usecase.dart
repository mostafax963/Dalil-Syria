import '../repositories/booking_repository.dart';

class CreateBookingUseCase {
  final BookingRepository repo;

  CreateBookingUseCase(this.repo);

  Future<void> call({
    required String tripId,
    required String fullName,
    required String email,
    required String phone,
    required String date,
    required int guests,
  }) {
    return repo.createBooking(
      tripId: tripId,
      fullName: fullName,
      email: email,
      phone: phone,
      date: date,
      guests: guests,
    );
  }
}
