import 'package:dalil_syria/core/errors/exceptions.dart';
import 'package:dalil_syria/core/errors/failures.dart';
import 'package:dalil_syria/core/network/network_info.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../domain/repositories/office_repository.dart';
import '../datasources/office_remote_data_source.dart';
import '../models/office_model.dart';
import '../models/trip_model.dart';

class OfficeRepositoryImpl implements OfficeRepository {
  final OfficeRemoteDataSource remote;
  final NetworkInfo networkInfo;

  OfficeRepositoryImpl(this.remote, this.networkInfo);

  @override
  Future<OfficeModel> getOffice(String id) async {
    if (!await networkInfo.isConnected) {
      throw ServerFailure("connection_state".tr());
    }

    try {
      final data = await remote.getOffice(id);

      return OfficeModel.fromMap(data);
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure("error_generic".tr());
    }
  }

  @override
  Future<List<TripModel>> getOfficeTrips(String id) async {
    if (!await networkInfo.isConnected) {
      throw ServerFailure("connection_state".tr());
    }

    try {
      final data = await remote.getOfficeTrips(id);

      return data.map((e) => TripModel.fromMap(e)).toList();
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure("error_generic".tr());
    }
  }
}
