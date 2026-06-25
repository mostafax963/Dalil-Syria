import 'package:dalil_syria/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repo;

  LoginUseCase(this.repo);

  Future<void> call(String email, String password) {
    return repo.login(email, password);
  }
}
