import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final loginKey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();
  final passwordConfirm = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();
  TextEditingController emailReturned = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passordConfirm = TextEditingController();
  TextEditingController pinPutController = TextEditingController();
  FocusNode pinPutFocusNode = FocusNode();
}
