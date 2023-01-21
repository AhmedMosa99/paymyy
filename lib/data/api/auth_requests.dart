import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paymyy/modules/auth/models/banks_model.dart';
import 'package:paymyy/modules/auth/models/forget_password_model.dart';
import 'package:paymyy/modules/auth/models/step_one_model.dart';
import 'package:paymyy/modules/auth/models/step_two_model.dart';
import 'package:paymyy/modules/auth/models/user_model.dart';

import '../../modules/auth/models/categories_model.dart';
import '../../modules/auth/models/code_model.dart';
import '../../modules/auth/models/step_three_model.dart';
import '../../shared/constant.dart';
import 'dio.dart';

class AuthDio {
  static Dio? dio;
  static String? baseUrl;
  static init() {
    dio = ApiDio.createDio();
    baseUrl = dio!.options.baseUrl;
  }

  //category
  static Future<CategoriesModel?> getCategories() async {
    String url = '${baseUrl}categories';
    Response request;
    CategoriesModel? categoriesModel;
    try {
      request = await dio!.get(
        "categories",
      );
      if (request.statusCode! < 400) {
        categoriesModel = CategoriesModel.fromJson(request.data);
      } else {
        categoriesModel = null;
      }
    } on Exception catch (e) {
      print(e);
    }
    return categoriesModel;
  }

  //getBanks
  static Future<BanksModel?> getBanks() async {
    String url = '${baseUrl}banks';
    Response request;
    BanksModel? banksModel;
    try {
      request = await dio!.get(
        url,
      );
      if (request.statusCode! < 400) {
        banksModel = BanksModel.fromJson(request.data);
      } else {
        banksModel = null;
      }
    } on Exception catch (e) {
      print(e);
    }
    return banksModel;
  }

// validation
  static Future<StepOneModel?> validationStepOne(
      {String? bussinessType,
      String? legalName,
      String? englishName,
      String? arabicName,
      String? phoneNumber,
      String? businessEmail,
      int? categoryId}) async {
    String url = '${baseUrl}auth/register/steps/1';
    StepOneModel? stepOneModel;
    Response request;
    FormData formData = FormData.fromMap({
      "bussiness_type": bussinessType,
      "legal_name": legalName,
      "english_name": englishName,
      "arabic_name": arabicName,
      "phone_number": phoneNumber,
      "business_email": businessEmail,
      "category_id": categoryId,
    });
    try {
      request = await dio!.post(url,
          data: formData,
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
            headers: {"Content-Type": "multipart/form-data"},
          ));
      if (request.statusCode! < 400) {
        stepOneModel = StepOneModel(
            status: request.data['status'],
            message: request.data['message'],
            data: null);
      } else {
        stepOneModel = StepOneModel.fromJson(request.data);
      }
    } on Exception catch (e) {
      print(e);
    }
    return stepOneModel;
  }

  static Future<StepTwoModel?> validationStepTwo({
    String? fullName,
    String? ownerEmail,
    String? ownerPhoneNumber,
    String? password,
    String? passwordConfirmation,
    String? businessEmail,
    String? nationality,
    String? bussinessType,
  }) async {
    String url = '${baseUrl}auth/register/steps/2';
    StepTwoModel? stepTwoModel;
    Response request;
    FormData formData = FormData.fromMap({
      "full_name": fullName,
      "owner_email": ownerEmail,
      "owner_phone_number": ownerPhoneNumber,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "business_email": businessEmail,
      "nationalty": nationality,
      "bussiness_type": bussinessType,
    });
    try {
      request = await dio!.post(url,
          data: formData,
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
            headers: {"Content-Type": "multipart/form-data"},
          ));
      print(request);
      if (request.statusCode! < 400) {
        stepTwoModel = StepTwoModel(
            status: request.data['status'],
            message: request.data['message'],
            data: null);
      } else {
        stepTwoModel = StepTwoModel.fromJson(request.data);
      }
    } on Exception catch (e) {
      print(e);
    }
    return stepTwoModel;
  }

  static Future<StepThreeModel?> validationStepThree({
    String? accountName,
    String? accountNumber,
    String? iban,
    String? bankId,
  }) async {
    String url = '${baseUrl}auth/register/steps/3';
    StepThreeModel? stepThreeModel;
    Response request;
    FormData formData = FormData.fromMap({
      "account_name": accountName,
      "account_number": accountNumber,
      "iban": iban,
      "bank_id": bankId,
    });
    try {
      request = await dio!.post(url,
          data: formData,
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
            headers: {"Content-Type": "multipart/form-data"},
          ));

      if (request.statusCode! < 400) {
        stepThreeModel = StepThreeModel(
            status: request.data['status'],
            message: request.data['message'],
            data: null);
      } else {
        stepThreeModel = StepThreeModel.fromJson(request.data);
      }
    } on Exception catch (e) {
      print(e);
    }
    return stepThreeModel;
  }

  static Future<UserModel?> register({
    String? bussinessType,
    String? legalName,
    String? englishName,
    String? arabicName,
    String? phoneNumber,
    String? businessEmail,
    String? fullName,
    String? ownerEmail,
    String? ownerPhoneNumber,
    String? password,
    String? passwordConfirmation,
    String? nationality,
    String? accountName,
    String? accountNumber,
    String? iban,
    String? bankId,
    String? categoryId,
  }) async {
    String url = '${baseUrl}auth/register';
    UserModel? userModel;
    Response request;
    FormData formData = FormData.fromMap({
      "account_name": accountName,
      "account_number": accountNumber,
      "iban": iban,
      "legal_name": legalName,
      "bank_id": bankId,
      "full_name": fullName,
      "owner_email": ownerEmail,
      "owner_phone_number": ownerPhoneNumber,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "business_email": businessEmail,
      "nationalty": nationality,
      "bussiness_type": bussinessType,
      "english_name": englishName,
      "arabic_name": arabicName,
      "phone_number": phoneNumber,
      "category_id": categoryId,
    });
    try {
      request = await dio!.post(url,
          data: formData,
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
            headers: {"Content-Type": "multipart/form-data"},
          ));
      print(request.data);
      if (request.statusCode! < 400) {
        userModel = UserModel.fromJson(request.data);
      } else {
        userModel = UserModel.fromJson(request.data);
      }
    } on Exception catch (e) {
      print(e);
    }
    return userModel;
  }

  static Future<UserModel?> login({
    String? email,
    String? password,
  }) async {
    String url = '${baseUrl}auth/login';
    UserModel? userModel;
    Response request;
    FormData formData = FormData.fromMap({
      "email": email,
      "password": password,
    });
    try {
      request = await dio!.post(url,
          data: formData,
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
            headers: {"Content-Type": "multipart/form-data"},
          ));
      if (request.statusCode! < 400) {
        userModel = UserModel.fromJson(request.data);
      } else {
        userModel = UserModel(
            status: request.data['status'],
            message: request.data['message'],
            data: null);
      }
    } on Exception catch (e) {
      print(e);
    }
    return userModel;
  }
  static Future<ForgetPasswordModel?> forgetPassword({
    String? email,
  }) async {
    String url = '${baseUrl}forgot-password';
    ForgetPasswordModel? forgetPasswordModel;
    Response request;
    FormData formData = FormData.fromMap({
      "email": email,
    });
    try {
      request = await dio!.post(url,
          data: formData,
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
            headers: {"Content-Type": "multipart/form-data"},
          ));
      if (request.statusCode! < 400) {
        forgetPasswordModel = ForgetPasswordModel(
            status: request.data['status'],
            message: request.data['message'],
            data: null);
      } else {
        forgetPasswordModel = ForgetPasswordModel.fromJson(request.data);
      }
    } on Exception catch (e) {
      print(e);
    }
    return forgetPasswordModel;
  }
  static Future<CodeModel?> verifyCode({
    String? email,
    String?code,
  }) async {
    String url = '${baseUrl}validate-code';
    CodeModel? codeModel;
    Response request;
    FormData formData = FormData.fromMap({
      "email": email,
      "code":code
    });
    try {
      request = await dio!.post(url,
          data: formData,
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
            headers: {"Content-Type": "multipart/form-data"},
          ));
      if (request.statusCode! < 400) {
        codeModel = CodeModel.fromJson(request.data);
      } else {
        codeModel =  CodeModel.fromJson(request.data);
      }
    } on Exception catch (e) {
      print(e);
    }
    return codeModel;
  }
  static Future<CodeModel?> createPassword({
    String? email,
    String?code,
    String?password
  }) async {
    String url = '${baseUrl}reset-password';
    CodeModel? codeModel;
    Response request;
    FormData formData = FormData.fromMap({
      "email": email,
      "code":code,
      "password":password,
    });
    try {
      request = await dio!.post(url,
          data: formData,
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
            headers: {"Content-Type": "multipart/form-data"},
          ));
      if (request.statusCode! < 400) {
        codeModel = CodeModel.fromJson(request.data);
      } else {
        codeModel =  CodeModel.fromJson(request.data);
      }
    } on Exception catch (e) {
      print(e);
    }
    return codeModel;
  }
}
