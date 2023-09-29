import 'package:firebase_auth/firebase_auth.dart';

abstract class IFirebaseAuthService {
  Stream authState();
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password);
  Future<UserCredential?> createUserWithEmailAndPassword(
      {required String email, required String password});
  Future<void> signOut();
  Future<String> getCurrentUser();
  Future<bool> isUserLoggedIn();
  Future<void> sendPasswordResetEmail(String email);
}
