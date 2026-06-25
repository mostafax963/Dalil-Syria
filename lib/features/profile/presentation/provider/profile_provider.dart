import 'package:dalil_syria/core/errors/failures.dart';
import 'package:dalil_syria/core/providers/connection_provider.dart';
import 'package:dalil_syria/features/profile/data/datasources/profile_remote_data_source.dart';

import 'package:dalil_syria/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:dalil_syria/features/profile/domain/entities/profile_entity.dart';
import 'package:dalil_syria/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:dalil_syria/features/profile/domain/usecases/logout_usecase.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileDataSourceProvider = Provider((ref) {
  return ProfileRemoteDataSource();
});

final profileRepositoryProvider = Provider((ref) {
  return ProfileRepositoryImpl(
    ref.read(profileDataSourceProvider),
    ref.read(networkInfoProvider),
  );
});

final getProfileUseCaseProvider = Provider((ref) {
  return GetProfileUseCase(ref.read(profileRepositoryProvider));
});
final logoutUseCaseProvider = Provider((ref) {
  return LogoutUseCase(ref.read(profileRepositoryProvider));
});

final profileProvider = FutureProvider<ProfileEntity>((ref) async {
  try {
    return await ref.read(getProfileUseCaseProvider).call();
  } on ServerFailure catch (e) {
    throw e.message;
  } catch (e) {
    throw "error_generic".tr();
  }
});
