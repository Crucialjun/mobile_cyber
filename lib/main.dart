import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_cyber/features/splash/screens/splash_screen.dart';
import 'package:mobile_cyber/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Cyber',
      theme: ThemeData(
        fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
