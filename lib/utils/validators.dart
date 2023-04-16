String? userNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter your username";
  } else if (!RegExp('[a-zA-Z]').hasMatch(value)) {
    return "Enter a valid username";
  }
  return null;
}
