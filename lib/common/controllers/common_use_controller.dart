import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:mobile_cyber/common/models/user_settings.dart';

import 'package:path_provider/path_provider.dart';

class CommonUseController {
  Isar? _isarDb;

  Future init() async {
    final dir = await getApplicationSupportDirectory();
    _isarDb = await Isar.open(
      [UserSettingsSchema],
      directory: dir.path,
    );
  }

  Future<void> saveUserSettings(UserSettings userSettings) async {
    await _isarDb?.writeTxn(() => _isarDb!.userSettings.put(userSettings));
  }

  Future<UserSettings?> getUserSettings() async {
    return await _isarDb?.userSettings.get(1);
  }
}

final commonUseController = Provider((ref) {
  return CommonUseController();
});
