import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class SubscriptionObject extends ParseObject implements ParseCloneable {
  SubscriptionObject() : super('Subscription');
  SubscriptionObject.clone() : this();

  @override
  clone(Map<String, dynamic> map) => SubscriptionObject.clone()..fromJson(map);

  DateTime? get expiredDate => get<DateTime>('expiredDate');

  set expiredDate(DateTime? value) {
    set('expiredDate', value);
  }
}
