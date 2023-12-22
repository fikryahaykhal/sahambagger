import 'package:main/domain/uimodel/profile_ui_model.dart';

class UserUiModel {
  final String objectId;
  final String email;
  final String username;
  ProfileUiModel? profile;

  UserUiModel(this.objectId, this.username, this.email);
}
