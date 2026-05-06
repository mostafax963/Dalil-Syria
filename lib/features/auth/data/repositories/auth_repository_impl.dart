import 'package:dalil_syria/features/auth/data/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<void> login(String email, String password) {
    return remote.login(email: email, password: password);
  }

  @override
  Future<void> logout() async {
    await Supabase.instance.client.auth.signOut();
  }

  @override
  bool isLoggedIn() {
    return remote.isLoggedIn();
  }
}
