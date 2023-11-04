import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:mobile_cyber/features/auth/repository/i_auth_repository.dart';
import 'package:mobile_cyber/features/auth/screens/sign_up_screen.dart';
import 'package:mobile_cyber/features/homepage/presentation/homepage_screen.dart';
import 'package:mobile_cyber/locator.dart';
import 'package:mobile_cyber/services/dialog_and_sheet_service/i_dialog_and_sheet_service.dart';
import 'package:mobile_cyber/services/navigation/i_navigation_service.dart';
import 'package:mobile_cyber/utils/dialogs/error_dialog.dart';

class SignInController extends ChangeNotifier {
  final _authRepo = locator<IAuthRepository>();
  final _navigation = locator<INavigationService>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final _dialogService = locator<IDialogAndSheetService>();

  void signInWithEmailAndPassword(
      {required String email, required String password}) async {
    _isLoading = true;
    notifyListeners();
    try {
      var result = await _authRepo.signInWithEmailAndPassword(
          email: email, password: password);
      _navigation.pushReplacementNamed(HomePageScreen.routeName,
          arguments: result);
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      _dialogService.showAppDialog(ErrorDialog(message: e.toString()));
      Logger().e(e.toString());
    }
  }

  void registerOptionSelected() {
    _navigation.pushNamed(SignUpScreen.routeName);
  }
}

final signInControllerProvider =
    Provider<SignInController>((ref) => SignInController());
