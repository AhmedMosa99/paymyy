import 'package:dio/dio.dart';
import 'package:paymyy/modules/auth/models/banks_model.dart';
import 'package:paymyy/modules/auth/models/forget_password_model.dart';
import 'package:paymyy/modules/auth/models/step_one_model.dart';
import 'package:paymyy/modules/auth/models/step_two_model.dart';
import 'package:paymyy/modules/auth/models/user_model.dart';
import 'package:paymyy/modules/home/models/add_services_model.dart';
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
      request = await dio!.get(
        "services",
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          },
          headers: {
            "Authorization":"Bearer $token"
          },
        )
      );
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
      request = await dio!.post(
          "services/$id",
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
            headers: {
              "Authorization":"Bearer $token"
            },
          )
      );
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

}
