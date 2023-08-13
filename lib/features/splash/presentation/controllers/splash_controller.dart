import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_cyber/features/auth/screens/sign_up_screen.dart';
import 'package:mobile_cyber/features/common/controllers/common_use_controller.dart';
import 'package:mobile_cyber/features/onboarding/screens/onboarding_screen.dart';
import 'package:mobile_cyber/locator.dart';
import 'package:mobile_cyber/services/navigation/i_navigation_service.dart';

class SplashController {
  final _navigationService = locator<INavigationService>();

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    final userSettings = await CommonUseController().getUserSettings();

    if (userSettings == null || userSettings.isFirstTime) {
      await _navigationService.pushReplacementNamed(OnboardingScreen.routeName);
    } else {
      await _navigationService.pushReplacementNamed(SignUpScreen.routeName);
    }
  }
}

final splashControllerProvider = Provider((ref) {
  return SplashController();
});
