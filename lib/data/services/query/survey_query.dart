import 'package:main/data/services/query/object/survey_object.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class SurveyQuery extends QueryBuilder<ParseObject> {
  SurveyQuery() : super(SurveyObject());
}
