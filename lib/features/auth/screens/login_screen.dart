import 'package:flutter/material.dart';
import 'package:mobile_cyber/features/common/constants.dart';
import 'package:mobile_cyber/utils/customTextFormDecoration.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login_screen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Hello There",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.0),
              child: Text(
                "Sign in to access all your application and saved documents",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              "Email",
            ),
            const SizedBox(
              height: 4,
            ),
            const TextField(
                decoration: CustomTextFieldDecoration(hintStringText: "Email")),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Password",
            ),
            const SizedBox(
              height: 4,
            ),
            const TextField(
                decoration:
                    CustomTextFieldDecoration(hintStringText: "password")),
            const SizedBox(
              height: 12,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot Password",
                style: TextStyle(color: appMainColor),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              decoration: BoxDecoration(
                  color: appMainColor, borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Align(
                alignment: Alignment.center, child: Text("Or Login With")),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Already have an account"),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Login",
                  style: TextStyle(
                      color: appMainColor, fontWeight: FontWeight.bold),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
