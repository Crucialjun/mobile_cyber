import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_cyber/utils/app_colors.dart';
import 'package:mobile_cyber/features/common/widgets/social_button.dart';
import 'package:mobile_cyber/utils/customTextFormDecoration.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login_screen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                      decoration:
                          CustomTextFieldDecoration(hintStringText: "Email")),
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
                      decoration: CustomTextFieldDecoration(
                          hintStringText: "Password")),
                  const SizedBox(
                    height: 12,
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(color: AppColors.appMainColor),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.appMainColor,
                        borderRadius: BorderRadius.circular(12)),
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
                      alignment: Alignment.center,
                      child: Text("Or Login With")),
                  const SizedBox(
                    height: 36,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SocialButton(
                        text: "Facebook",
                        icon: FontAwesomeIcons.facebookF,
                      ),
                      SocialButton(
                        text: "Google",
                        icon: FontAwesomeIcons.google,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account"),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Register",
                        style: TextStyle(
                            color: AppColors.appMainColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
