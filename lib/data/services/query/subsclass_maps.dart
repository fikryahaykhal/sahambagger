import 'package:main/data/services/query/object/profile_object.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

Map<String, ParseObjectConstructor> get subsclassMaps {
  return {'Profile': () => ProfileObject()};
}
