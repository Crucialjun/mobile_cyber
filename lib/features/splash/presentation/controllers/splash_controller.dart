import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:mobile_cyber/common/controllers/common_use_controller.dart';
import 'package:mobile_cyber/features/auth/screens/login_screen.dart';
import 'package:mobile_cyber/features/auth/screens/sign_up_screen.dart';
import 'package:mobile_cyber/features/homepage/presentation/homepage_screen.dart';
import 'package:mobile_cyber/features/onboarding/screens/onboarding_screen.dart';
import 'package:mobile_cyber/locator.dart';
import 'package:mobile_cyber/services/database_service/i_database_service.dart';
import 'package:mobile_cyber/services/firebase_auth/i_firebase_auth_service.dart';
import 'package:mobile_cyber/services/navigation/i_navigation_service.dart';

class SplashController {
  final _navigationService = locator<INavigationService>();

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));

    final userSettings = await CommonUseController().getUserSettings();

    final authService = locator<IFirebaseAuthService>();

    final dbService = locator<IDatabaseService>();

    if (userSettings == null || userSettings.isFirstTime) {
      await _navigationService.pushReplacementNamed(OnboardingScreen.routeName);
    } else {
      await authService.isUserLoggedIn().then((value) async {
        if (value == null) {
          await _navigationService.pushReplacementNamed(LoginScreen.routeName);
        } else {
          Logger().i("uid is ${value.uid}");
          final user = await dbService.getUserFromDb(value.uid);
          await _navigationService
              .pushReplacementNamed(HomePageScreen.routeName, arguments: user);
        }
      });
    }
  }
}

final splashControllerProvider = Provider((ref) {
  return SplashController();
});
