import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_cyber/utils/app_colors.dart';

class DarkTheme {
  DarkTheme._();

  static final theme = ThemeData(
      primaryColor: AppColors.appMainColor,
      scaffoldBackgroundColor: AppColors.darkBackgroundColor,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        toolbarHeight: 0.0,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: AppColors.darkBackgroundColor,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.dark,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: AppColors.appMainColor,
      ));
}
