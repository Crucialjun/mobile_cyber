import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mobile_cyber/features/common/constants.dart';
import 'package:mobile_cyber/utils/customTextFormDecoration.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = "sign_up_screen";

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            SizedBox(
              height: 24,
            ),
            Text(
              "Register",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.0),
              child: Text(
                "All your online applications available at your fingertips when and wherever you need them",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Username",
            ),
            SizedBox(
              height: 4,
            ),
            TextField(
                decoration:
                    CustomTextFieldDecoration(hintStringText: "username")),
            SizedBox(
              height: 4,
            ),
            Text("Enter your phone number"),
            SizedBox(
              height: 4,
            ),
            InternationalPhoneNumberInput(
              autofillHints: [AutofillHints.telephoneNumber],
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
              inputDecoration: CustomTextFieldDecoration(hintStringText: ""),
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
                Text(
                  "Email",
                ),
                SizedBox(
                  height: 4,
                ),
                TextField(
                    decoration:
                    CustomTextFieldDecoration(hintStringText: "Email")),
                Text(
                  "Password",
                ),
                SizedBox(
                  height: 4,
                ),
                TextField(
                    decoration:
                    CustomTextFieldDecoration(hintStringText: "password")),
                Text(
                  "Confirm Password",
                ),
                SizedBox(
                  height: 4,
                ),
                TextField(
                    decoration:
                    CustomTextFieldDecoration(hintStringText: "Confirm Password")),
                SizedBox(height: 24,),
                Container(
                  decoration: BoxDecoration(
                    color: appMainColor,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: const Text("Register",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,),),
                  ),
                ),
                SizedBox(height: 24,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Already have an account"),SizedBox(width: 4,), Text("Login",style: TextStyle(color: appMainColor,fontWeight: FontWeight.bold),)],
                )
          ]),
        ),
      ),
    );
  }
}
