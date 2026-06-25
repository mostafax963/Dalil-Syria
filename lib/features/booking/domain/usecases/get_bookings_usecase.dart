import '../entities/booking_entity.dart';
import '../repositories/booking_repository.dart';

class GetBookingsUseCase {
  final BookingRepository repo;

  GetBookingsUseCase(this.repo);

  Future<List<BookingEntity>> call() {
    return repo.getBookings();
  }
}
