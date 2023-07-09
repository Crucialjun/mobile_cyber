// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:isar/isar.dart';

part 'user_settings.g.dart';

@Collection(inheritance: false)
class UserSettings {
  Id id = Isar.autoIncrement;
  bool isFirstTime = true;
  bool isAuthenticated = false;
}
