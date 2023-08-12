import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_cyber/services/firebase_auth/i_firebase_auth_service.dart';

class FirebaseAuthService implements IFirebaseAuthService {
  final _auth = FirebaseAuth.instance;

  @override
  Future<String> createUserWithEmailAndPassword(String email, String password) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<String> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isUserLoggedIn() {
    // TODO: implement isUserLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }

  @override
  Future<String> signInWithEmailAndPassword(String email, String password) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Stream authState() {
    _auth.authStateChanges();
    throw UnimplementedError();
  }
}
