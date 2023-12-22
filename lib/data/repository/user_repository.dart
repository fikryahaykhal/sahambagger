import 'package:dartz/dartz.dart';
import 'package:main/core/failure.dart';
import 'package:main/data/mapper/mapper.dart';
import 'package:main/data/services/query/object/profile_object.dart';
import 'package:main/data/services/query/profile_query.dart';
import 'package:main/domain/repository/user_repository.dart';
import 'package:main/domain/uimodel/user_ui_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class UserRepositoryImpl extends UserRepository {
  final ParseUser _user;
  final ProfileQuery _profileQuery;

  UserRepositoryImpl(this._user, this._profileQuery);

  @override
  Future<Either<Failure, UserUiModel>> getCurrentUser() async {
    try {
      final user = _user.toJson().toUser();
      final profileQuery = _profileQuery
        ..whereEqualTo('user', _user.toPointer());

      final profileResponse = await profileQuery.query();

      if (profileResponse.results != null) {
        final result = profileResponse.results?.first as ProfileObject;
        user.profile = result.toUiModel();
      }

      return right(user);
    } on ParseException catch (e) {
      return left(Failure(e.toString()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
