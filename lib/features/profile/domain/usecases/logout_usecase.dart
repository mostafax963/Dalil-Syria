import 'package:dalil_syria/core/errors/failures.dart';

import '../repositories/profile_repository.dart';

class LogoutUseCase {
  final ProfileRepository repo;

  LogoutUseCase(this.repo);

  Future<void> call() async {
    try {
      await repo.logout();
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    }
  }
}
