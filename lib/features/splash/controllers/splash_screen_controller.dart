import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_cyber/locator.dart';
import 'package:mobile_cyber/services/navigation_service.dart/i_navigation_service.dart';

class SplashScreenController {
  final _navigation = locator<INavigationService>();

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    
  }
}

final splashScreenControllerProvider =
    Provider((ref) => SplashScreenController());
