import 'package:dalil_syria/core/errors/exceptions.dart';
import 'package:dalil_syria/core/providers/connection_provider.dart';

import 'package:dalil_syria/features/booking/domain/entities/booking_entity.dart';
import 'package:dalil_syria/features/booking/domain/usecases/create_booking_usecase.dart';
import 'package:dalil_syria/features/booking/domain/usecases/get_bookings_usecase.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/booking_remote_datasource.dart';
import '../../data/repositories/booking_repository_impl.dart';
import '../../domain/repositories/booking_repository.dart';

final bookingDataSourceProvider = Provider((ref) {
  return BookingRemoteDataSource();
});

final bookingRepositoryProvider = Provider<BookingRepository>((ref) {
  return BookingRepositoryImpl(
    ref.read(bookingDataSourceProvider),
    ref.read(networkInfoProvider),
  );
});

final createBookingUseCaseProvider = Provider((ref) {
  return CreateBookingUseCase(ref.read(bookingRepositoryProvider));
});

final getBookingsUseCaseProvider = Provider((ref) {
  return GetBookingsUseCase(ref.read(bookingRepositoryProvider));
});

final createBookingProvider = FutureProvider.family<void, Map<String, dynamic>>(
  (ref, data) async {
    try {
      await ref
          .read(createBookingUseCaseProvider)
          .call(
            tripId: data['tripId'],
            fullName: data['fullName'],
            email: data['email'],
            phone: data['phone'],
            date: data['date'],
            guests: data['guests'],
          );
    } on ServerException catch (e) {
      throw e.message;
    } catch (e) {
      throw "error_generic".tr();
    }
  },
);

final bookingsProvider = FutureProvider<List<BookingEntity>>((ref) async {
  try {
    return await ref.read(getBookingsUseCaseProvider).call();
  } on ServerException catch (e) {
    throw e.message;
  } catch (_) {
    throw "error_generic".tr();
  }
});
