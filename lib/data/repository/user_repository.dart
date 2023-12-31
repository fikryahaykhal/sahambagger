import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:main/core/failure.dart';
import 'package:main/data/mapper/mapper.dart';
import 'package:main/data/services/query/object/profile_object.dart';
import 'package:main/data/services/query/object/subscription_object.dart';
import 'package:main/data/services/query/object/survey_object.dart';
import 'package:main/data/services/query/profile_query.dart';
import 'package:main/data/services/query/subscription_query.dart';
import 'package:main/data/services/query/survey_query.dart';
import 'package:main/domain/repository/user_repository.dart';
import 'package:main/domain/uimodel/user_ui_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class UserRepositoryImpl extends UserRepository {
  final _profileQuery = ProfileQuery();
  final _subsQuery = SubscriptionQuery();
  final _surveyQuery = SurveyQuery();

  UserRepositoryImpl();

  @override
  Future<Either<Failure, UserUiModel>> getCurrentUser() async {
    try {
      final userObj = await ParseUser.currentUser() as ParseUser;
      final user = userObj.toJson().toUser();

      final profileQuery = _profileQuery
        ..whereEqualTo('user', userObj.toPointer());
      final profileResponse = await profileQuery.query();

      if (profileResponse.results != null) {
        final result = profileResponse.results?.first as ProfileObject;
        user.profile = result.toUiModel();
      }

      final subsQuery = _subsQuery..whereEqualTo('user', userObj.toPointer());
      final subsResponse = await subsQuery.query();

      if (subsResponse.results != null) {
        final result = subsResponse.results?.first as SubscriptionObject;
        user.subs = result.toUiModel();
      }

      final surveyQuery = _surveyQuery
        ..whereEqualTo('user', userObj.toPointer());
      final surveyResponse = await surveyQuery.query();

      if (surveyResponse.results != null) {
        final result = surveyResponse.results?.first as SurveyObject?;
        user.hasSurvey = result != null;
      }

      return right(user);
    } on ParseException catch (e) {
      return left(Failure(e.toString()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> doSignOut() async {
    try {
      final userObj = await ParseUser.currentUser() as ParseUser;
      await userObj.logout();

      return right(true);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> doSignUp(
    String name,
    int age,
    String phoneNumber,
    String username,
    String email,
    String password,
  ) async {
    try {
      final userObj = ParseUser(username, password, email);
      final signUpRsp = await userObj.signUp();

      if (!signUpRsp.success) {
        return left(Failure(signUpRsp.error?.message));
      }

      final profileObj = ProfileObject();
      profileObj.age = age;
      profileObj.fullname = name;
      profileObj.phoneNumber = phoneNumber;

      profileObj.addRelation('user', [userObj]);

      final savedProfileRsp = await profileObj.save();

      if (!savedProfileRsp.success) {
        return left(Failure(savedProfileRsp.error?.message));
      }

      return right(true);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> doSubmitSurvey(
    source,
    ability,
    needs,
    risk,
    sahamPrefs,
    portofolio,
  ) async {
    try {
      final userObj = await ParseUser.currentUser() as ParseUser;

      final newSurvey = SurveyObject();
      newSurvey.ability = ability;
      newSurvey.source = source;
      newSurvey.needs = needs;
      newSurvey.risk = risk;
      newSurvey.sahamPrefs = sahamPrefs;
      newSurvey.portofolio = portofolio;

      newSurvey.addRelation('user', [userObj]);

      final response = await newSurvey.save();

      if (!response.success) {
        return left(Failure(response.error?.message.toString()));
      }

      return right(true);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
