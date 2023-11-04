import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_cyber/features/auth/repository/i_auth_repository.dart';
import 'package:mobile_cyber/features/auth/screens/login_screen.dart';
import 'package:mobile_cyber/features/homepage/presentation/homepage_screen.dart';

import 'package:mobile_cyber/locator.dart';
import 'package:mobile_cyber/services/dialog_and_sheet_service/i_dialog_and_sheet_service.dart';
import 'package:mobile_cyber/services/navigation/i_navigation_service.dart';
import 'package:mobile_cyber/utils/dialogs/error_dialog.dart';

class SignUpController extends ChangeNotifier {
  final _authRepo = locator<IAuthRepository>();

  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final _dialog = locator<IDialogAndSheetService>();
  final _navigation = locator<INavigationService>();

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String username,
      required String phoneNumber}) async {
    try {
      setLoading(true);
      await _authRepo
          .signUpWithEmailAndPassword(
              email: email,
              password: password,
              username: username,
              phoneNumber: phoneNumber)
          .then((value) => _navigation.pushReplacementNamed(
              HomePageScreen.routeName,
              arguments: value));
    } catch (e) {
      setLoading(false);
      _dialog.showAppDialog(ErrorDialog(message: e.toString()));
    }
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void loginOptionSelected() {
    _navigation.pushNamed(LoginScreen.routeName);
  }
}

final signUpControllerProvider =
    ChangeNotifierProvider<SignUpController>((ref) => SignUpController());
