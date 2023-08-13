import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:logger/logger.dart';
import 'package:mobile_cyber/features/auth/controllers/sign_up_controller.dart';
import 'package:mobile_cyber/features/auth/screens/login_screen.dart';
import 'package:mobile_cyber/utils/app_colors.dart';
import 'package:mobile_cyber/utils/customTextFormDecoration.dart';
import 'package:mobile_cyber/utils/validators.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const String routeName = "sign_up_screen";

  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final PhoneNumber _defaultNumber = PhoneNumber(isoCode: 'KE');
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Register",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 36.0),
                      child: Text(
                        "All your online applications available at your fingertips when and wherever you need them",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    const Text(
                      "Username",
                    ),
                    TextFormField(
                        validator: (value) {
                          return AppValidators().userNameValidator(value);
                        },
                        decoration: const CustomTextFieldDecoration(
                            hintStringText: "username")),
                    SizedBox(
                      height: 14.h,
                    ),
                    const Text("Enter your phone number"),
                    InternationalPhoneNumberInput(
                      autofillHints: const [AutofillHints.telephoneNumber],
                      hintText: "Enter your phone here",
                      //textStyle: const TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                      onInputChanged: (PhoneNumber number) {
                        if (number.phoneNumber != null) {}
                      },
                      onInputValidated: (bool value) {},
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                      ignoreBlank: false,
                      initialValue: _defaultNumber,
                      inputDecoration:
                          const CustomTextFieldDecoration(hintStringText: ""),
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      cursorColor: Colors.black,
                      //selectorTextStyle: const TextStyle(color: Colors.black),
                      textFieldController: _phoneNumberController,
                      formatInput: false,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      inputBorder: const OutlineInputBorder(),
                      onSaved: (PhoneNumber number) {},
                    ),
                    const Text(
                      "Email",
                    ),
                    TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          return AppValidators().emailStringValidator(value);
                        },
                        decoration: const CustomTextFieldDecoration(
                            hintStringText: "Email")),
                    SizedBox(
                      height: 14.h,
                    ),
                    const Text(
                      "Password",
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        return TextField(
                            obscureText: !ref
                                .watch(signUpControllerProvider)
                                .isPasswordVisible,
                            controller: _passwordController,
                            decoration: CustomTextFieldDecoration(
                                endIcon: InkWell(
                                    onTap: () {
                                      ref
                                          .read(signUpControllerProvider)
                                          .togglePasswordVisibility();
                                      Logger().d("tapped");
                                    },
                                    child: ref
                                            .watch(signUpControllerProvider)
                                            .isPasswordVisible
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off)),
                                hintStringText: "password"));
                      },
                    ),
                    SizedBox(height: 4.h),
                    FlutterPwValidator(
                      successColor: AppColors.appMainColor,
                      width: 300.w,
                      height: 50.h,
                      minLength: 6,
                      onSuccess: () {},
                      controller: _passwordController,
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    const Text(
                      "Confirm Password",
                    ),
                    TextFormField(
                        validator: (value) {
                          return AppValidators().confirmPasswordValidator(
                              value: value, password: _passwordController.text);
                        },
                        decoration: const CustomTextFieldDecoration(
                            hintStringText: "Confirm Password")),
                    SizedBox(
                      height: 14.h,
                    ),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          ref
                              .read(signUpControllerProvider)
                              .signUpWithEmailAndPassword(
                                  email: _emailController.text.trim(),
                                  password: _confirmPasswordController.text);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.appMainColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Register",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account"),
                        const SizedBox(
                          width: 4,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(LoginScreen.routeName);
                          },
                          child: const Text(
                            "Login",
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
