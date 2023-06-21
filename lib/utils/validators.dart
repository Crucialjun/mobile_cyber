import 'package:email_validator/email_validator.dart';

class AppValidators {
  String? userNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your username";
    } else if (!RegExp('[a-zA-Z]').hasMatch(value)) {
      return "Enter a valid username";
    }
    return null;
  }

  String? emailStringValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    } else if (!EmailValidator.validate(value)) {
      return "Please enter a valid username";
    }
    return null;
  }

  String? confirmPasswordValidator(
      {required String? value, required String? password}) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    } else if (value != password) {
      return "Password does not match";
    }
    return null;
  }
}
