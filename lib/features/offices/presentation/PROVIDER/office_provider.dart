import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/office_remote_data_source.dart';
import '../../data/repositories/office_repository_impl.dart';
import '../../domain/usecases/get_office_details_usecase.dart';

final officeDataSourceProvider = Provider((ref) {
  return OfficeRemoteDataSource();
});

final officeRepositoryProvider = Provider((ref) {
  return OfficeRepositoryImpl(ref.read(officeDataSourceProvider));
});

final officeDetailsUseCaseProvider = Provider((ref) {
  return GetOfficeDetailsUseCase(ref.read(officeRepositoryProvider));
});

final officeDetailsProvider =
    FutureProvider.family<Map<String, dynamic>, String>((ref, officeId) async {
      final useCase = ref.read(officeDetailsUseCaseProvider);
      return await useCase(officeId);
    });
