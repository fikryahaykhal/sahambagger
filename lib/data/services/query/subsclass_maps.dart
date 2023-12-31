import 'package:main/data/services/query/object/profile_object.dart';
import 'package:main/data/services/query/object/subscription_object.dart';
import 'package:main/data/services/query/object/survey_object.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

Map<String, ParseObjectConstructor> get subsclassMaps {
  return {
    'Profile': () => ProfileObject(),
    'Subscription': () => SubscriptionObject(),
    'Survey': () => SurveyObject(),
  };
}
