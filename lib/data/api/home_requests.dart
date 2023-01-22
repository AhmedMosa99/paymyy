import 'package:dio/dio.dart';
import 'package:paymyy/modules/auth/models/banks_model.dart';
import 'package:paymyy/modules/auth/models/forget_password_model.dart';
import 'package:paymyy/modules/auth/models/step_one_model.dart';
import 'package:paymyy/modules/auth/models/step_two_model.dart';
import 'package:paymyy/modules/auth/models/user_model.dart';
import 'package:paymyy/modules/home/models/add_services_model.dart';
import 'package:paymyy/modules/home/models/client_screen.dart';
import 'package:paymyy/modules/home/models/customer_info_model.dart';
import 'package:paymyy/modules/home/models/services_model.dart';

import '../../modules/auth/models/categories_model.dart';
import '../../modules/auth/models/code_model.dart';
import '../../modules/auth/models/step_three_model.dart';
import '../../shared/constant.dart';
import 'dio.dart';

class HomeDio {
  static Dio? dio;
  static String? baseUrl;
  static init() {
    dio = ApiDio.createDio();
    baseUrl = dio!.options.baseUrl;
  }

  //Services
  static Future<ServicesModel?> getServices() async {
    Response request;
    ServicesModel? servicesModel;
    try {
      print(token);
      request = await dio!.get("services",
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
            headers: {"Authorization": "Bearer $token"},
          ));
      if (request.statusCode! < 400) {
        servicesModel = ServicesModel.fromJson(request.data);
      } else {
        servicesModel = null;
      }
    } on Exception catch (e) {
      print(e);
    }
    return servicesModel;
  }

  static Future<AddServicesModel?> postServices(int id) async {
    Response request;
    AddServicesModel? addServicesModel;
    try {
      print(token);
      request = await dio!.post("services/$id",
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
            headers: {"Authorization": "Bearer $token"},
          ));
      if (request.statusCode! < 400) {
        addServicesModel = AddServicesModel.fromJson(request.data);
      } else {
        addServicesModel = AddServicesModel.fromJson(request.data);
      }
    } on Exception catch (e) {
      print(e);
    }
    return addServicesModel;
  }

  // client
  static Future<CustomersModel?> getCustomers(int page) async {
    Response request;
    CustomersModel? customersModel;
    try {
      request = await dio!.get("customers?page=$page",
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
            headers: {"Authorization": "Bearer $token"},
          ));
      if (request.statusCode! < 400) {
        customersModel = CustomersModel.fromJson(request.data);
      } else {
        customersModel = null;
      }
    } on Exception catch (e) {
      print(e);
    }
    return customersModel;
  }

  static Future<CustomerInfoModel?> getCustomerInfo(int id) async {
    Response request;
    CustomerInfoModel? customerInfoModel;
    try {
      request = await dio!.get("customers/$id",
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
            headers: {"Authorization": "Bearer $token"},
          ));
      if (request.statusCode! < 400) {
        customerInfoModel = CustomerInfoModel.fromJson(request.data);
      } else {
        customerInfoModel = null;
      }
    } on Exception catch (e) {
      print(e);
    }
    return customerInfoModel;
  }

  static Future<CustomerInfoModel?> addCustomer({
    String? email,
    String?accountNumber,
    String? fulLName,
    String? phoneNumber,
    String? iban,
    String? bankId,
  }) async {
    CustomerInfoModel? customerInfoModel;
    Response request;
    FormData formData = FormData.fromMap({
      "email": email,
      "full_name": fulLName,
      "account_number":accountNumber,
      "phone_number": phoneNumber,
      "has_bank": 1,
      "iban": iban,
      "bank_id": bankId,
    });
    try {
      request = await dio!.post("customers",
          data: formData,
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
            headers: {
              "Content-Type": "multipart/form-data",
              "Authorization": "Bearer $token"
            },
          ));
      if (request.statusCode! < 400) {
        customerInfoModel = CustomerInfoModel.fromJson(request.data);
      } else {
        customerInfoModel = null;
      }
    } on Exception catch (e) {
      print(e);
    }
    return customerInfoModel;
  }
}
