// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:isar/isar.dart';

part 'user_settings.g.dart';

@Collection(inheritance: false)
class UserSettings {
  final Id id;
  final bool isFirstTime;
  final bool isAuthenticated;

  const UserSettings({
    this.id = Isar.autoIncrement,
    this.isFirstTime = true,
    this.isAuthenticated = false,
  });

  UserSettings copyWith({
    Id? id,
    bool? isFirstTime,
    bool? isAuthenticated,
  }) {
    return UserSettings(
      id: id ?? this.id,
      isFirstTime: isFirstTime ?? this.isFirstTime,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}
