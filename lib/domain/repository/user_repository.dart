import 'package:dartz/dartz.dart';
import 'package:main/core/failure.dart';
import 'package:main/domain/uimodel/user_ui_model.dart';

abstract class UserRepository {
  Future<Either<Failure, UserUiModel>> getCurrentUser();
}
