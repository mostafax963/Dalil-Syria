import 'package:dalil_syria/core/errors/exceptions.dart';
import 'package:dalil_syria/core/network/network_info.dart';
import 'package:dalil_syria/features/booking/data/models/booking_model.dart';
import 'package:dalil_syria/features/booking/domain/entities/booking_entity.dart';
import 'package:easy_localization/easy_localization.dart';

import '../datasources/booking_remote_datasource.dart';
import '../../domain/repositories/booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remote;
  final NetworkInfo networkInfo;

  BookingRepositoryImpl(this.remote, this.networkInfo);

  @override
  Future<void> createBooking({
    required String tripId,
    required String fullName,
    required String email,
    required String phone,
    required String date,
    required int guests,
  }) async {
    if (!await networkInfo.isConnected) {
      throw ServerException("no_internet".tr());
    }

    try {
      await remote.createBooking(
        tripId: tripId,
        fullName: fullName,
        email: email,
        phone: phone,
        date: date,
        guests: guests,
      );
    } on ServerException {
      rethrow;
    } catch (_) {
      throw ServerException("error_booking_create".tr());
    }
  }

  @override
  Future<List<BookingEntity>> getBookings() async {
    if (!await networkInfo.isConnected) {
      throw ServerException("no_internet".tr());
    }

    try {
      final result = await remote.getBookings();

      return result.map<BookingModel>((e) => BookingModel.fromMap(e)).toList();
    } on ServerException {
      rethrow;
    } catch (_) {
      throw ServerException("error_bookings_load".tr());
    }
  }
}
