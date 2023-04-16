import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mobile_cyber/features/auth/screens/login_screen.dart';
import 'package:mobile_cyber/features/common/constants.dart';
import 'package:mobile_cyber/utils/customTextFormDecoration.dart';
import 'package:mobile_cyber/utils/validators.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "sign_up_screen";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'KE');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Register",
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
                        "All your online applications available at your fingertips when and wherever you need them",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Username",
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                        validator: (value) {
                          return userNameValidator(value);
                        },
                        decoration: const CustomTextFieldDecoration(
                            hintStringText: "username")),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text("Enter your phone number"),
                    const SizedBox(
                      height: 4,
                    ),
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
                      initialValue: number,
                      inputDecoration:
                          const CustomTextFieldDecoration(hintStringText: ""),
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      cursorColor: Colors.black,
                      selectorTextStyle: const TextStyle(color: Colors.black),
                      textFieldController: phoneNumberController,
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
                    const SizedBox(
                      height: 4,
                    ),
                    const TextField(
                        decoration:
                            CustomTextFieldDecoration(hintStringText: "Email")),
                    const Text(
                      "Password",
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const TextField(
                        decoration: CustomTextFieldDecoration(
                            hintStringText: "password")),
                    const Text(
                      "Confirm Password",
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const TextField(
                        decoration: CustomTextFieldDecoration(
                            hintStringText: "Confirm Password")),
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: appMainColor,
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
                    const SizedBox(
                      height: 24,
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
                                color: appMainColor,
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
