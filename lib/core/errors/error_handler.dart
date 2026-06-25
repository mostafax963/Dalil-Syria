import 'exceptions.dart';
import 'failures.dart';

class ErrorHandler {
  static Failure handle(Exception e) {
    if (e is ServerException) {
      return ServerFailure(e.message);
    }

    if (e is CacheException) {
      return CacheFailure(e.message);
    }

    if (e is NetworkException) {
      return NetworkFailure(e.message);
    }

    if (e is AuthException) {
      return AuthFailure(e.message);
    }

    return ServerFailure("حدث خطأ غير متوقع");
  }
}
