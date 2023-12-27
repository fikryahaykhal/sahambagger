import 'package:main/data/services/query/object/subscription_object.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class SubscriptionQuery extends QueryBuilder<ParseObject> {
  SubscriptionQuery() : super(SubscriptionObject());
}
