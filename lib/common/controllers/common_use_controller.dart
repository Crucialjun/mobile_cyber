import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:mobile_cyber/common/models/user_settings.dart';

import 'package:path_provider/path_provider.dart';

class CommonUseController {
  late Future<Isar> isarDb;

  CommonUseController() {
    isarDb = openDb();
  }

  Future<Isar> openDb() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationSupportDirectory();
      return await Isar.open(
        [UserSettingsSchema],
        inspector: true,
        directory: dir.path,
      );
    } else {
      return Future.value(Isar.getInstance());
    }
  }

  Future<void> saveUserSettings(UserSettings userSettings) async {
    Logger().i("CommonUseController saving user settings");
    final db = await isarDb;
    await db.writeTxn(() async {
      db.userSettings.put(userSettings);
    });
  }

  Future<UserSettings?> getUserSettings() async {
    final db = await isarDb;
    return await db.userSettings.get(1);
  }
}

final commonUseController = Provider((ref) {
  return CommonUseController();
});
