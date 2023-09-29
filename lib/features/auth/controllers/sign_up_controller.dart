import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_cyber/features/auth/repository/i_auth_repository.dart';
import 'package:mobile_cyber/locator.dart';

class SignUpController extends ChangeNotifier {
  final _authRepo = locator<IAuthRepository>();

  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future<UserCredential?> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String username,
      required String phoneNumber}) async {
    try {
      return await _authRepo.signUpWithEmailAndPassword(
          email: email,
          password: password,
          username: username,
          phoneNumber: phoneNumber);
    } catch (e) {
      rethrow;
    }
  }
}

final signUpControllerProvider =
    ChangeNotifierProvider<SignUpController>((ref) => SignUpController());
