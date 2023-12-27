import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class SurveyObject extends ParseObject implements ParseCloneable {
  SurveyObject() : super('Survey');
  SurveyObject.clone() : this();

  @override
  clone(Map<String, dynamic> map) => SurveyObject.clone()..fromJson(map);

  String? get source => get<String>('source');
  String? get ability => get<String>('ability');
  String? get needs => get<String>('needs');
  String? get risk => get<String>('risk');
  String? get sahamPrefs => get<String>('sahamPrefs');
  String? get portofolio => get<String>('portofolio');

  set source(String? value) => set('source', value);
  set ability(String? value) => set('ability', value);
  set needs(String? value) => set('needs', value);
  set risk(String? value) => set('risk', value);
  set sahamPrefs(String? value) => set('sahamPrefs', value);
  set portofolio(String? value) => set('portofolio', value);
}
