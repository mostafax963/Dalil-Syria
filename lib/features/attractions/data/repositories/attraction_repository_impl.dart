import 'package:dalil_syria/core/errors/exceptions.dart';
import 'package:dalil_syria/core/errors/failures.dart';
import 'package:dalil_syria/core/network/network_info.dart';
import 'package:dalil_syria/features/attractions/data/datasources/attraction_remote_data_source.dart';
import 'package:dalil_syria/features/attractions/domain/entities/attraction_details_entity.dart';
import 'package:dalil_syria/features/attractions/domain/entities/attraction_entity.dart';
import 'package:dalil_syria/features/attractions/domain/repositories/attraction_repository.dart';
import 'package:easy_localization/easy_localization.dart';

class AttractionRepositoryImpl implements AttractionRepository {
  final AttractionRemoteDataSource remote;
  final NetworkInfo networkInfo;

  AttractionRepositoryImpl(this.remote, this.networkInfo);

  @override
  Future<List<AttractionEntity>> getAttractions() async {
    if (!await networkInfo.isConnected) {
      throw ServerFailure("no_internet".tr());
    }

    try {
      return await remote.getAttractions();
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure("error_generic".tr());
    }
  }

  @override
  Future<AttractionDetailsEntity> getAttractionDetails(String id) async {
    if (!await networkInfo.isConnected) {
      throw ServerFailure("no_internet".tr());
    }

    try {
      return await remote.getAttractionDetails(id);
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure("error_generic".tr());
    }
  }
}
