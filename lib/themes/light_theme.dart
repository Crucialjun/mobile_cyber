import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_cyber/utils/app_colors.dart';

class LightTheme {
  LightTheme._();

  static final theme = ThemeData(
    primaryColor: AppColors.appMainColor,
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      toolbarHeight: 0.0,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: AppColors.lightBackgroundColor,

        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: AppColors.appMainColor,
    ),
  );
}
