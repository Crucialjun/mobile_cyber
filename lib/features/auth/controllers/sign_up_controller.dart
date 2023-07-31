import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_cyber/features/auth/repository/auth_repository.dart';

class SignUpController extends ChangeNotifier {
  final AuthRepository _authRepository;
  bool _isPasswordVisible = false;

  SignUpController(this._authRepository);

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future<UserCredential?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _authRepository.signUpWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}

final signUpControllerProvider =
    ChangeNotifierProvider<SignUpController>((ref) => SignUpController(
          ref.watch(authRepositoryProvider),
        ));
