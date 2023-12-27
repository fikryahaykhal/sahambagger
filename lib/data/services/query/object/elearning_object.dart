import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class ELearnignObject extends ParseObject implements ParseCloneable {
  ELearnignObject() : super('ELearning');
  ELearnignObject.clone() : this();

  @override
  clone(Map<String, dynamic> map) => ELearnignObject.clone()..fromJson(map);

  String get title => get('title');
  String get desription => get('desription');
  String get url => get('title');
  bool get isVip => get('is_vip');
}
