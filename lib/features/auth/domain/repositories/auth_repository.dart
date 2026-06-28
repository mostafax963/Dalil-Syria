abstract class AuthRepository {
  Future<void> login(String email, String password);

  Future<void> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  });

  bool isLoggedIn();
}
