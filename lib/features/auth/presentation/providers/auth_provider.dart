import 'package:dalil_syria/features/auth/data/repositories/auth_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/login_usecase.dart';

final authDataSourceProvider = Provider((ref) {
  return AuthRemoteDataSource();
});

final authRepositoryProvider = Provider((ref) {
  return AuthRepositoryImpl(ref.read(authDataSourceProvider));
});

final loginUseCaseProvider = Provider((ref) {
  return LoginUseCase(ref.read(authRepositoryProvider));
});

class AuthState {
  final bool isLoading;
  final String? error;

  AuthState({this.isLoading = false, this.error});

  AuthState copyWith({bool? isLoading, String? error}) {
    return AuthState(isLoading: isLoading ?? this.isLoading, error: error);
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository repo;

  final LoginUseCase loginUseCase;

  AuthNotifier(this.loginUseCase, this.repo) : super(AuthState());
  bool isLoggedIn() {
    return repo.isLoggedIn();
  }

  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await loginUseCase(email, password);

      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: "Email or password incorrect".tr(),
      );
      return false;
    }
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true);

    try {
      await repo.logout();

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: "Logout failed");
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repo = ref.read(authRepositoryProvider);
  final usecase = ref.read(loginUseCaseProvider);

  return AuthNotifier(usecase, repo);
});
