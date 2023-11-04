import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_cyber/common/widgets/social_button.dart';
import 'package:mobile_cyber/features/auth/controllers/sign_in_controller.dart';
import 'package:mobile_cyber/utils/app_button.dart';
import 'package:mobile_cyber/utils/app_colors.dart';
import 'package:mobile_cyber/utils/customTextFormDecoration.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String routeName = "login_screen";
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                    TextField(
                        controller: _emailController,
                        decoration: const CustomTextFieldDecoration(
                            hintStringText: "Email")),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "Password",
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: const CustomTextFieldDecoration(
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
                    InkWell(
                      onTap: () {
                        ref
                            .read(signInControllerProvider)
                            .signInWithEmailAndPassword(
                                email: _emailController.text.trim(),
                                password: _passwordController.text);
                      },
                      child: AppButton(
                        isLoading:
                            ref.watch(signInControllerProvider).isLoading,
                        label: "Login",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account"),
                        const SizedBox(
                          width: 4,
                        ),
                        InkWell(
                          onTap: () {
                            ref
                                .read(signInControllerProvider)
                                .registerOptionSelected();
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                                color: AppColors.appMainColor,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
