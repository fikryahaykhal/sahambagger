import 'package:main/data/services/query/object/profile_object.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class ProfileQuery extends QueryBuilder<ParseObject> {
  ProfileQuery() : super(ProfileObject());
}
