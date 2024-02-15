import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_cyber/features/splash/presentation/screens/splash_screen.dart';
import 'package:mobile_cyber/router.dart';
import 'package:mobile_cyber/services/navigation/navigation_service.dart';
import 'package:mobile_cyber/themes/dark_theme.dart';
import 'package:mobile_cyber/themes/light_theme.dart';

class MyApp extends StatelessWidget {
    const MyApp({super.key});
  
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return ScreenUtilInit(
        designSize: const Size(375, 667),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Mobile Cyber',
            theme: LightTheme.theme,
            darkTheme: DarkTheme.theme,
            home: const SplashScreen(),
            navigatorKey: NavigationService.navigatorKey,
            onGenerateRoute: (settings) => generateRoute(settings),
          );
        },
      );
    }
  }