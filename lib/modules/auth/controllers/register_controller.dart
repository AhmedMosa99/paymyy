import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/data/api/auth_requests.dart';
import 'package:paymyy/data/local_data/share_pref.dart';
import 'package:paymyy/modules/auth/models/banks_model.dart';
import 'package:paymyy/modules/auth/models/categories_model.dart';
import 'package:paymyy/modules/auth/models/step_one_model.dart';
import 'package:paymyy/modules/auth/models/step_two_model.dart';
import 'package:paymyy/modules/auth/models/user_model.dart';
import 'package:paymyy/shared/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/enums/stepper.dart';
import '../../../data/models/stepper_model.dart';
import '../models/step_three_model.dart';

class RegisterController extends GetxController {
  TextEditingController orgName = TextEditingController();
  TextEditingController brandArabic = TextEditingController();
  TextEditingController brandEnglish = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController emailFirst = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passordConfirm = TextEditingController();
  TextEditingController mobilePhone = TextEditingController();
  TextEditingController accountNameOwener = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController iban = TextEditingController();
  TextEditingController bankName = TextEditingController();
  CategoriesModel? categoriesModel;
  BanksModel? banksModel;
  String? varietiesSelect;
  String? bankSelect;
  int ?idBank;
  StepOneModel? stepOneModel;
  StepTwoModel? stepTwoModel;
  StepThreeModel? stepThreeModel;
  UserModel?userModel;
  int groupVal = 1;
  int? idSelect;
  int currentStep = 0;
  bool isCompleted=false;
  bool val=false;
  bool isLoading=false;
  bool isLoadingOne=false;
  bool isLoadingTwo=false;
  bool isLoadingThree=false;

  List<StepperModel> steps = [
    StepperModel(num: 1, state: StepperState.current),
    StepperModel(num: 2, state: StepperState.notReached),
    StepperModel(num: 3, state: StepperState.notReached),
    StepperModel(num: 4, state: StepperState.notReached),
  ];

  onChangedValue(x) {
    groupVal = x!;
    update();
  }
  onChangedCheck(x) {
    val = x;
    update();
  }

  getCategories() async {
    categoriesModel = await AuthDio.getCategories();
    update();
  }
  getBanks() async {
    banksModel = await AuthDio.getBanks();
    update();
  }

  chooseValue(String value, int id) {
    varietiesSelect = value;
    idSelect = id;
    update();
  }
  chooseBank(String value, int id) {
    bankSelect = value;
    idBank = id;
    update();
  }

  clearControllers() {}
  File? updatedFile;
  final firstKey = GlobalKey<FormState>();
  final secondKey = GlobalKey<FormState>();
  final thirdKey = GlobalKey<FormState>();

  selectProfileImage() async {
    XFile file =
        await ImagePicker().pickImage(source: ImageSource.gallery) ?? XFile('');
    updatedFile = File(file.path);
    update();
  }

  firstStepFunction() async {
    if (varietiesSelect!=null) {
      if (firstKey.currentState!.validate()) {
        isLoadingOne=true;
        update();
        stepOneModel = await AuthDio.validationStepOne(
            bussinessType: groupVal == 1 ? "Home_Bussiness" : "Company",
            legalName: groupVal == 2 ? orgName.text : "",
            englishName: brandEnglish.text,
            arabicName: brandArabic.text,
            phoneNumber: phone.text,
            categoryId: idSelect,
            businessEmail: emailFirst.text);
        isLoading=false;
        if (stepOneModel!.status == true) {
          nextStep();
          currentStep++;
        } else {
          Get.snackbar("عذرا", stepOneModel!.message!,
              backgroundColor: AppColors.primary, colorText: Colors.white);
        }
      }
    }else{
      Get.snackbar("عذرا", "الصنف مطلوب",
          backgroundColor: AppColors.primary, colorText: Colors.white);
    }
    update();
  }
  secondStepFunction() async {
    if (secondKey.currentState!.validate()) {
      isLoadingTwo=true;
      update();
      stepTwoModel = await AuthDio.validationStepTwo(
        bussinessType: groupVal == 1 ? "Home_Bussiness" : "Company",
        ownerEmail: email.text,
        fullName: fullName.text,
        nationality: "Indian",
        ownerPhoneNumber: mobilePhone.text,
        password: password.text,
        passwordConfirmation: passordConfirm.text,
        businessEmail: email.text,
      );
      isLoadingTwo=false;

      if (stepTwoModel!.status == true) {
        nextStep();
        currentStep++;
      } else {
        Get.snackbar("عذرا", stepTwoModel!.message!,
            backgroundColor: AppColors.primary, colorText: Colors.white);
      }
    }
    update();
  }
  threeStepFunction() async {
  if(val){
    if (thirdKey.currentState!.validate()) {
      stepThreeModel = await AuthDio.validationStepThree(
        iban: iban.text,
        bankId: idBank.toString(),
        accountName: accountNameOwener.text,
        accountNumber: accountNumber.text,
      );
      if (stepThreeModel!.status == true) {
       await register() ;
        if(isCompleted){
          nextStep();
          currentStep++;
        }
      } else {
        Get.snackbar("عذرا", stepThreeModel!.message!,
            backgroundColor: AppColors.primary, colorText: Colors.white);
      }
      update();
    }
  }else{
    Get.snackbar("عذرا", "يرجى الموافقة علي سياسة الخصوصية",
        backgroundColor: AppColors.primary, colorText: Colors.white);
  }
  }
  register() async {
    isLoading=true ;
   update();
      userModel = await AuthDio.register(
        bussinessType: groupVal == 1 ? "Home_Bussiness" : "Company",
        legalName: groupVal == 2 ? orgName.text : "",
        englishName: brandEnglish.text,
        arabicName: brandArabic.text,
        phoneNumber: phone.text,
        categoryId: idSelect.toString(),
        businessEmail: emailFirst.text,
            ownerEmail: email.text,
            fullName: fullName.text,
            nationality: "Indian",
            ownerPhoneNumber: mobilePhone.text,
            password: password.text,
            passwordConfirmation: passordConfirm.text,
        iban: iban.text,
        bankId: idBank.toString(),
        accountName: accountNameOwener.text,
        accountNumber: accountNumber.text,
      );
      isLoading=false;
      if(userModel!.status==true){
       await SharePref.init();
       await SharePref.setData(key: "token",data: userModel!.data!.token!);
        token=userModel?.data?.token!;
        isCompleted=true;
      }else{
        isCompleted=false;
      }
  }

  nextStep() {
    steps[currentStep].state = StepperState.Completed;
    steps[currentStep + 1].state = StepperState.current;
    update();
  }

  previousStep() {
    steps[currentStep].state = StepperState.notReached;
    steps[currentStep - 1].state = StepperState.current;
    update();
  }

  @override
  void onInit() {
    AuthDio.init();
    getCategories();
    getBanks();
    super.onInit();
  }
}
