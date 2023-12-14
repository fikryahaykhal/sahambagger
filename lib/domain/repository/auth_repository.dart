import 'package:dartz/dartz.dart';
import 'package:main/core/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> doLogin(String username, String password);
  Future<Either<Failure, bool>> doGoogleLogin();
}
