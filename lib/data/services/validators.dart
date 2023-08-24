import 'package:email_validator/email_validator.dart';

class Validators {
  nameValidator(String value) {
    if (value.isEmpty) {
      return 'Name field is required';
    }
    if (value.length < 4) {
      return 'Please enter a name with more than 3 characters';
    }
  }

  emailValidator(String value) {
    if (value.isEmpty) {
      return 'Email field is required';
    }
    if (!EmailValidator.validate(value)) {
      return 'Please enter valid email address';
    }
  }

  passwordValidator(String value) {
    if (value.isEmpty) {
      return 'Password field is required';
    }

    if (!RegExp(r'(?=.*?[!@#\$&*~])').hasMatch(value)) {
      return 'Should contain at least one Special character';
    }
    if (!RegExp(r'(?=.*?[0-9])').hasMatch(value)) {
      return 'Should contain at least one digit';
    }
    if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
      return 'Should contain at least one lower case';
    }
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
      return 'Should contain at least one upper case';
    }
    if (!RegExp(r'.{8,}').hasMatch(value)) {
      return 'Must be at least 8 characters in length';
    }
  }

  confirmPasswordValidator(String value, String password) {
    if (value.isEmpty) {
      return 'Confirm Password field is required';
    }

    if (value != password) {
      return 'Password does not match';
    }
  }
}