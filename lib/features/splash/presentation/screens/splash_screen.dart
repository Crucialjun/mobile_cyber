import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:mobile_cyber/features/splash/presentation/controllers/splash_controller.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const String routeName = "splash_screen";
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    ref.read(splashControllerProvider).init();

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
