abstract class IFirebaseAuthService {
  Stream authState();
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<String> getCurrentUser();
  Future<bool> isUserLoggedIn();
  Future<void> sendPasswordResetEmail(String email);
}
