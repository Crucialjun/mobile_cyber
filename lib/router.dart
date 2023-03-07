import 'package:flutter/material.dart';
import 'package:mobile_cyber/features/common/screens/error_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    default:
      return MaterialPageRoute(builder: (((context) => const ErrorScreen())));
  }
}
