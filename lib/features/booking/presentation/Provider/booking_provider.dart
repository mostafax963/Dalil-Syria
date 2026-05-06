import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/booking_remote_datasource.dart';
import '../../data/repositories/booking_repository_impl.dart';
import '../../domain/repositories/booking_repository.dart';
import '../../data/models/booking_model.dart';

final bookingDataSourceProvider = Provider((ref) {
  return BookingRemoteDataSource();
});

final bookingRepositoryProvider = Provider<BookingRepository>((ref) {
  return BookingRepositoryImpl(ref.read(bookingDataSourceProvider));
});

final createBookingProvider = FutureProvider.family<void, Map<String, dynamic>>(
  (ref, data) async {
    await ref.read(bookingRepositoryProvider).createBooking(data);
  },
);

final bookingsProvider = FutureProvider<List<BookingModel>>((ref) async {
  final res = await ref.read(bookingRepositoryProvider).getBookings();

  return res.map((e) => BookingModel.fromMap(e)).toList();
});
