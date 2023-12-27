import 'package:main/data/services/query/object/ELearning_object.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class ELearningQuery extends QueryBuilder<ParseObject> {
  ELearningQuery() : super(ELearnignObject());
}
