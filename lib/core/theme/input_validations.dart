import 'package:get/get.dart';

class InputValidations {
  static String? validateName(String? value) {
    if (value!.length == 0)
      return 'this field is required';
    else
      return null;
  }

  static String? validateEmail(String? value) {
    if (value!.length == 0)
      return 'this field is required';
    else if (!value.isEmail) {
      return 'you should input a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value, String match) {
    if (value!.length == 0)
      return 'this field is required';
    else if (value != match) {
      return 'password not matched';
    }
    return null;
  }
}
