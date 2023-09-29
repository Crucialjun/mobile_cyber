import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:mobile_cyber/features/auth/repository/i_auth_repository.dart';
import 'package:mobile_cyber/features/homepage/presentation/homepage_screen.dart';
import 'package:mobile_cyber/locator.dart';
import 'package:mobile_cyber/services/navigation/i_navigation_service.dart';

class SignInController {
  final _authRepo = locator<IAuthRepository>();
  final _navigation = locator<INavigationService>();
  void signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var result = await _authRepo.signInWithEmailAndPassword(
          email: email, password: password);
      _navigation.pushReplacementNamed(HomePageScreen.routeName,
          arguments: result);
    } catch (e) {
      Logger().e(e.toString());
    }
  }
}

final signInControllerProvider =
    Provider<SignInController>((ref) => SignInController());
