import 'package:dartz/dartz.dart';
import 'package:main/core/failure.dart';
import 'package:main/domain/uimodel/user_ui_model.dart';

abstract class UserRepository {
  Future<Either<Failure, UserUiModel>> getCurrentUser();

  Future<Either<Failure, bool>> doSignOut();

  Future<Either<Failure, bool>> doSignUp(
    String name,
    int age,
    String phoneNumber,
    String username,
    String email,
    String password,
  );

  Future<Either<Failure, bool>> doSubmitSurvey(
    source,
    ability,
    needs,
    risk,
    sahamPrefs,
    portofolio,
  );
}
