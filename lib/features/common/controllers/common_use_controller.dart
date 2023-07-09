import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:mobile_cyber/features/common/models/user_settings.dart';
import 'package:path_provider/path_provider.dart';

class CommonUseController {
  late Future<Isar> _isarDb;
  UserSettings? _userSettings;

  CommonUseController() {
    _isarDb = init();
  }

  Future<Isar> init() async {
    print("database init called init");
    final dir = await getApplicationSupportDirectory();
    return Isar.open(
      [UserSettingsSchema],
      inspector: true,
      directory: dir.path,
    );
  }

  Future<void> saveUserSettings(UserSettings userSettings) async {
    final isar = await _isarDb;
    await isar.writeTxn(() => isar.userSettings.put(userSettings));
  }

  Future<UserSettings?> getUserSettings() async {
    final isar = await _isarDb;
    return await isar.userSettings.get(1);
  }
}

final commonUseController = Provider((ref) {
  return CommonUseController();
});
