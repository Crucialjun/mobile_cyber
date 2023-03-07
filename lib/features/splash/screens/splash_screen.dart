import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
                style: TextStyle(fontSize: 68),
              ),
            ]),
      ),
    );
  }
}
