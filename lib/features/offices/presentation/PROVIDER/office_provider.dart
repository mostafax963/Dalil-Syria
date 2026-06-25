import 'package:dalil_syria/core/errors/failures.dart';
import 'package:dalil_syria/core/providers/connection_provider.dart';
import 'package:dalil_syria/features/offices/domain/entities/office_details_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/office_remote_data_source.dart';
import '../../data/repositories/office_repository_impl.dart';
import '../../domain/usecases/get_office_details_usecase.dart';

final officeDataSourceProvider = Provider((ref) {
  return OfficeRemoteDataSource();
});

final officeRepositoryProvider = Provider((ref) {
  return OfficeRepositoryImpl(
    ref.read(officeDataSourceProvider),
    ref.read(networkInfoProvider),
  );
});

final officeDetailsUseCaseProvider = Provider((ref) {
  return GetOfficeDetailsUseCase(ref.read(officeRepositoryProvider));
});

final officeDetailsProvider =
    FutureProvider.family<OfficeDetailsEntity, String>((ref, officeId) async {
      try {
        final useCase = ref.read(officeDetailsUseCaseProvider);

        return await useCase(officeId);
      } on ServerFailure catch (e) {
        throw e.message;
      } catch (e) {
        throw "error_generic".tr();
      }
    });
