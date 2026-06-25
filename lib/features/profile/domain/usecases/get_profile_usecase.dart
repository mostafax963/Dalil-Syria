import 'package:dalil_syria/core/errors/failures.dart';
import 'package:dalil_syria/features/profile/domain/entities/profile_entity.dart';

import '../repositories/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository repo;

  GetProfileUseCase(this.repo);

  Future<ProfileEntity> call() async {
    try {
      return await repo.getProfile();
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    }
  }
}
