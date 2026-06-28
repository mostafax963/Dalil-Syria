import 'package:dalil_syria/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repo;

  RegisterUseCase(this.repo);

  Future<void> call({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) {
    return repo.register(
      fullName: fullName,
      email: email,
      phone: phone,
      password: password,
    );
  }
}
