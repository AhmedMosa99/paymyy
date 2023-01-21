import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/data/api/auth_requests.dart';
import 'package:paymyy/data/local_data/share_pref.dart';
import 'package:paymyy/modules/auth/models/code_model.dart';
import 'package:paymyy/modules/auth/models/forget_password_model.dart';
import 'package:paymyy/modules/auth/models/user_model.dart';
import 'package:paymyy/routes/app_routes.dart';

import '../../../shared/constant.dart';

class LoginController extends GetxController {
  final loginKey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();
  final passwordConfirm = GlobalKey<FormState>();
  bool isLoading = false;
  bool isLoadingCode = false;
  UserModel? userModel;
  CodeModel?codeModel;
  CodeModel?createPasswords;
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();
  TextEditingController emailReturned = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordNew = TextEditingController();
  TextEditingController passwordNewConfirm = TextEditingController();
  TextEditingController passordConfirm = TextEditingController();
  TextEditingController pinPutController = TextEditingController();
  ForgetPasswordModel? forgetPasswordModel;
  FocusNode pinPutFocusNode = FocusNode();
  login() async {
    if (loginKey.currentState!.validate()) {
      userModel = await AuthDio.login(
          email: emailController.text, password: passwordController.text);
      if (userModel != null) {
        if (userModel!.status == true) {
          await SharePref.init();
          await SharePref.setData(key: "token", data: userModel!.data!.token!);
          token = userModel?.data?.token!;
          Get.offAllNamed(AppRoutes.mainPage);
        } else {
          Get.snackbar("عذرا", userModel!.message!,
              backgroundColor: AppColors.primary, colorText: Colors.white);
        }
      } else {
        Get.snackbar("عذرا", "حاول مرة اخرى",
            backgroundColor: AppColors.primary, colorText: Colors.white);
      }
    }
  }

  sendCodeResentPassword() async {
    isLoading = true;
    update();
    forgetPasswordModel =
        await AuthDio.forgetPassword(email: emailReturned.text);
    isLoading = false;
    update();
    if (forgetPasswordModel != null) {
      if (forgetPasswordModel!.status == true) {
        Get.toNamed(AppRoutes.codeCheck);
      } else {
        Get.snackbar("عذرا", forgetPasswordModel!.message!,
            backgroundColor: AppColors.primary, colorText: Colors.white);
      }
    } else {
      Get.snackbar("عذرا", "حاول مرة اخرى",
          backgroundColor: AppColors.primary, colorText: Colors.white);
    }
    update();
  }
  verifyPassword() async {
    isLoadingCode = true;
    update();
    codeModel =
        await AuthDio.verifyCode(email: emailReturned.text,code: pinPutController.text);
    isLoadingCode = false;
    if (codeModel != null) {
      if (codeModel!.status == true) {
        Get.snackbar("تم", codeModel!.message!,
            backgroundColor: AppColors.primary, colorText: Colors.white);
        Get.toNamed(AppRoutes.createPassword);
      } else {
        Get.snackbar("عذرا", codeModel!.message!,
            backgroundColor: AppColors.primary, colorText: Colors.white);
      }
    } else {
      Get.snackbar("عذرا", "حاول مرة اخرى",
          backgroundColor: AppColors.primary, colorText: Colors.white);
    }
    update();
  }
  createPassword() async {
    createPasswords =
    await AuthDio.createPassword(email: emailReturned.text,code: pinPutController.text,password: passwordNew.text);
    isLoadingCode = false;
    if (createPasswords != null) {
      if (createPasswords!.status == true) {
        Get.snackbar("تم", createPasswords!.message!,
            backgroundColor: AppColors.primary, colorText: Colors.white);
        Get.offAllNamed(AppRoutes.login);
      } else {
        Get.snackbar("عذرا", createPasswords!.message!,
            backgroundColor: AppColors.primary, colorText: Colors.white);
      }
    } else {
      Get.snackbar("عذرا", "حاول مرة اخرى",
          backgroundColor: AppColors.primary, colorText: Colors.white);
    }
    update();
  }

}
