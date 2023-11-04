import 'package:flutter/material.dart';
import 'package:mobile_cyber/services/navigation/i_navigation_service.dart';

class NavigationService implements INavigationService {
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<dynamic> pushReplacementNamed(String routeName,
      {Object? arguments}) async {
    return await navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  @override
  Future pushNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }
}
