import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:mobile_cyber/features/auth/screens/sign_up_screen.dart';
import 'package:mobile_cyber/features/common/models/user_settings.dart';
import 'package:mobile_cyber/features/onboarding/screens/onboarding_screen.dart';
import 'package:path_provider/path_provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash_screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      final dir = await getApplicationDocumentsDirectory();
      final isarSession = await Isar.open(
        [UserSettingsSchema],
        directory: dir.path,
      );

      final userSettings = await isarSession.userSettings.where().findFirst();

      if (userSettings == null) {
        await isarSession.writeTxn(() async {
          await isarSession.userSettings.put(UserSettings());
        });
      } else {
        if (userSettings.isFirstTime) {
          Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
        } else {
          Navigator.pushReplacementNamed(context, SignUpScreen.routeName);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark),
        toolbarHeight: 0.0,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Mobile",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 68,
                      fontFamily: GoogleFonts.anton().fontFamily,
                      fontWeight: FontWeight.bold)),
              const Text(
                "Cyber",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 68, fontWeight: FontWeight.w500),
              ),
            ]),
      ),
    );
  }
}
