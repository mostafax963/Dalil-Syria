import 'package:dalil_syria/core/errors/exceptions.dart';
import 'package:dalil_syria/core/errors/failures.dart';
import 'package:dalil_syria/core/network/network_info.dart';
import 'package:dalil_syria/features/trips/data/datasources/trip_remote_data_source.dart';
import 'package:dalil_syria/features/trips/data/models/trip_details_model.dart';
import 'package:dalil_syria/features/trips/domain/repositories/trip_repository.dart';
import 'package:easy_localization/easy_localization.dart';

class TripRepositoryImpl implements TripRepository {
  final TripRemoteDataSource remote;
  final NetworkInfo networkInfo;

  TripRepositoryImpl(this.remote, this.networkInfo);

  @override
  Future<TripDetailsModel> getTripDetails(String id) async {
    if (!await networkInfo.isConnected) {
      throw ServerFailure("no_internet".tr());
    }

    try {
      return await remote.getTripDetails(id);
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } catch (_) {
      throw ServerFailure("error_generic".tr());
    }
  }
}
