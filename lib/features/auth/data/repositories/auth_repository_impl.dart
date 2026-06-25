import 'package:dalil_syria/features/auth/domain/repositories/auth_repository.dart';

import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<void> login(String email, String password) async {
    await remote.login(email: email, password: password);
  }

  @override
  bool isLoggedIn() {
    return remote.isLoggedIn();
  }
}
