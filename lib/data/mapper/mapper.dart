import 'package:main/data/dto/item_content_dto.dart';
import 'package:main/data/services/query/object/profile_object.dart';
import 'package:main/domain/uimodel/item_content_ui_model.dart';
import 'package:main/domain/uimodel/profile_ui_model.dart';
import 'package:main/domain/uimodel/user_ui_model.dart';

extension UserObjectMapper on Map<String, dynamic> {
  UserUiModel toUser() {
    return UserUiModel(this['objectId'], this['username'], this['email']);
  }
}

extension ProfileObjectMapper on ProfileObject {
  ProfileUiModel toUiModel() {
    return ProfileUiModel(fullname ?? '', age ?? 0, photo ?? '');
  }
}

extension ItemContentDTOMapper on ItemContentDTO {
  ItemContentUiModel toUiModel() {
    return ItemContentUiModel(
      id ?? '',
      title ?? '',
      featureImage ?? '',
      slug ?? '',
    );
  }
}
