import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = "sign_up_screen";
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: const [
          Text(
            "Sign Up",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Create Account",
            style: TextStyle(fontSize: 34),
          )
        ]),
      ),
    );
  }
}
