import 'package:mobile_cyber/common/models/app_user.dart';

abstract class IDatabaseService {
  Future addUserToDb(AppUser user);
  Future<AppUser?> getUserFromDb(String uid);
}
