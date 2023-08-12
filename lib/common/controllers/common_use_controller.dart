import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:mobile_cyber/common/models/user_settings.dart';

import 'package:path_provider/path_provider.dart';

class CommonUseController {
  Isar? _isarDb;

  Future<void> saveUserSettings(UserSettings userSettings) async {
    await _isarDb!.writeTxn(() => _isarDb!.userSettings.put(userSettings));
  }

  Future<UserSettings?> getUserSettings() async {
    final dir = await getApplicationSupportDirectory();
    Isar isar = await Isar.open(
      [UserSettingsSchema],
      directory: dir.path,
    );
    _isarDb = isar;
    return await isar.userSettings.get(1);
  }
}

final commonUseController = Provider((ref) {
  return CommonUseController();
});
