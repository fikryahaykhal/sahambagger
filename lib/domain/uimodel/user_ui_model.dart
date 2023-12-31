import 'package:main/domain/uimodel/profile_ui_model.dart';
import 'package:main/domain/uimodel/subcription_ui_model.dart';

class UserUiModel {
  final String objectId;
  final String email;
  final String username;

  bool hasSurvey = false;
  ProfileUiModel? profile;
  SubscriptionUiModel? subs;

  UserUiModel(this.objectId, this.username, this.email);
}
