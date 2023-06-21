import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mobile_cyber/features/auth/screens/login_screen.dart';
import 'package:mobile_cyber/utils/constants.dart';
import 'package:mobile_cyber/utils/customTextFormDecoration.dart';
import 'package:mobile_cyber/utils/validators.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "sign_up_screen";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final PhoneNumber _defaultNumber = PhoneNumber(isoCode: 'KE');
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      textStyle: const TextStyle(color: Colors.black),
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
                      selectorTextStyle: const TextStyle(color: Colors.black),
                      textFieldController: _phoneNumberController,
                      formatInput: false,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      inputBorder: const OutlineInputBorder(),
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                    const Text(
                      "Email",
                    ),
                    TextFormField(
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
                    const TextField(
                        decoration: CustomTextFieldDecoration(
                            hintStringText: "password")),
                    SizedBox(
                      height: 14.h,
                    ),
                    const Text(
                      "Confirm Password",
                    ),
                    const TextField(
                        decoration: CustomTextFieldDecoration(
                            hintStringText: "Confirm Password")),
                    SizedBox(
                      height: 14.h,
                    ),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {}
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
