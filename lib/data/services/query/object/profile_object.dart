import 'dart:io';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class ProfileObject extends ParseObject implements ParseCloneable {
  ProfileObject() : super('Profile');
  ProfileObject.clone() : this();

  @override
  clone(Map<String, dynamic> map) => ProfileObject.clone()..fromJson(map);

  String? get fullname => get<String>('fullname');

  set fullname(String? value) {
    set('fullname', value);
  }

  int? get age => get<int>('age');

  set age(int? value) {
    set('age', value);
  }

  String? get phoneNumber => get<String>('phoneNumber');

  set phoneNumber(String? value) {
    set('phoneNumber', value);
  }

  String? get photo {
    final fileObj = get<ParseFileBase>('photo');
    return fileObj?.url;
  }

  void setPhoto(File file) async {
    final parseFile = ParseFile(file);

    await parseFile.save();

    set('photo', parseFile);
  }
}
