import 'package:get/get.dart';

class InputValidations {
  static String? validateName(String? value) {
    if (value!.length == 0)
      return 'هذا الحقل  مطلوب';
    else
      return null;
  }

  static String? validateEmail(String? value) {
    if (value!.length == 0)
      return 'هذا الحقل  مطلوب';
    else if (!value.isEmail) {
      return 'يجب عليك إدخال بريد إلكتروني صالح';
    }
    return null;
  }

  static String? validatePassword(String? value, String match) {
    if (value!.length == 0) {
      return 'هذا الحقل  مطلوب';
    } else if (value != match) {
      return 'كلمة المرور غير متطابقة';
    }
    return null;
  }
}
