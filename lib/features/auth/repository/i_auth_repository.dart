import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_cyber/common/models/app_user.dart';

abstract class IAuthRepository {
  Future<UserCredential?> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
    required String phoneNumber,
  });

  Future<AppUser?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
