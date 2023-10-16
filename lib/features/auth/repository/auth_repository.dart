import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:mobile_cyber/common/models/app_user.dart';
import 'package:mobile_cyber/features/auth/repository/i_auth_repository.dart';
import 'package:mobile_cyber/services/database_service/i_database_service.dart';
import 'package:mobile_cyber/services/firebase_auth/i_firebase_auth_service.dart';

import '../../../locator.dart';

class AuthRepository implements IAuthRepository {
  final _auth = locator<IFirebaseAuthService>();
  final _database = locator<IDatabaseService>();
  Stream authState() {
    return _auth.authState();
  }

  @override
  Future<AppUser?> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
    required String phoneNumber,
  }) async {
    try {
      UserCredential? creds = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      AppUser user = AppUser(
          uid: creds?.user?.uid ?? "",
          email: email,
          username: username,
          photoUrl: creds?.user?.photoURL ?? "",
          telephoneNumber: phoneNumber);

      _database.addUserToDb(user);
      return user;
    } catch (e) {
      Logger().e(e);
      rethrow;
    }
  }

  @override
  Future<AppUser?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    var credentials = await _auth.signInWithEmailAndPassword(email, password);

    if (credentials != null) {
      var user = await _database.getUserFromDb(credentials.user!.uid);
      return user;
    }
    return null;
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final authStateStreamProvider = StreamProvider((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return authRepo.authState();
});
