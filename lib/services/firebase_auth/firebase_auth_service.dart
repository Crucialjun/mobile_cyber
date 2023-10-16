import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:mobile_cyber/services/firebase_auth/i_firebase_auth_service.dart';

class FirebaseAuthService implements IFirebaseAuthService {
  final _auth = FirebaseAuth.instance;

  @override
  Future<UserCredential?> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw ('The account already exists for that email. Please Login');
      }
    } catch (e) {
      Logger().e(e);
      rethrow;
    }
    return null;
  }

  @override
  Future<String> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<User?> isUserLoggedIn() {
    return Future.value(_auth.currentUser);
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }

  @override
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Stream authState() {
    return _auth.authStateChanges();
  }
}
