import 'package:flutter/material.dart';
import 'package:mobile_cyber/common/screens/error_screen.dart';
import 'package:mobile_cyber/features/auth/screens/login_screen.dart';
import 'package:mobile_cyber/features/auth/screens/sign_up_screen.dart';
import 'package:mobile_cyber/features/onboarding/screens/onboarding_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnboardingScreen.routeName:
      return MaterialPageRoute(
          builder: ((context) => const OnboardingScreen()));
    case SignUpScreen.routeName:
      return MaterialPageRoute(builder: ((context) => const SignUpScreen()));
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: ((context) => const LoginScreen()));
    default:
      return MaterialPageRoute(builder: (((context) => const ErrorScreen())));
  }
}
