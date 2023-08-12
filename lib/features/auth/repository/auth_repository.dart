import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:mobile_cyber/services/firebase_auth/i_firebase_auth_service.dart';

import '../../../locator.dart';

class AuthRepository {
  final _auth = locator<IFirebaseAuthService>();
  Stream authState() {
    return _auth.authState();
  }

  Future<UserCredential?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Logger().e(e);
      rethrow;
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final authStateStreamProvider = StreamProvider((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return authRepo.authState();
});
