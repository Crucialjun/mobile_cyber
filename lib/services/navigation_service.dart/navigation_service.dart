import 'package:flutter/material.dart';
import 'package:mobile_cyber/services/navigation_service.dart/i_navigation_service.dart';

class NavigationService implements INavigationService {
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
      String routeName,
      {Object? arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }
}
