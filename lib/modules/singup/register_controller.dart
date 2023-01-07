import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  TextEditingController orgName = TextEditingController();
  TextEditingController brandArabic = TextEditingController();
  TextEditingController brandEnglish = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passordConfirm = TextEditingController();
  TextEditingController mobilePhone = TextEditingController();
  TextEditingController accountNameOwener = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController ipan = TextEditingController();
  TextEditingController bankName = TextEditingController();

  clearControllers() {}
  File? updatedFile;
  final firstKey = GlobalKey<FormState>();
  final secondKey = GlobalKey<FormState>();
  final thirdKey = GlobalKey<FormState>();

  selectProfileImage() async {
    XFile file =
        await ImagePicker().pickImage(source: ImageSource.gallery) ?? XFile('');
    this.updatedFile = File(file.path);
    update();
  }
}
