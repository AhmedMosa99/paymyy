import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/data/api/home_requests.dart';
import 'package:paymyy/modules/home/models/add_services_model.dart';

import '../models/services_model.dart';

class HomeController extends GetxController{
  ServicesModel?servicesModel;
  AddServicesModel? addServicesModel;


//services
  getServices()async {
    servicesModel=await HomeDio.getServices();
    update();
  }
  requestServices(id)async {
    addServicesModel=await HomeDio.postServices(id);
    if(addServicesModel!=null){
      if(addServicesModel!.status!){
        Get.snackbar("تم", addServicesModel!.message!,backgroundColor: AppColors.primary,colorText: Color(0xffffffff));
      }else{
        Get.snackbar("عذرا", addServicesModel!.message!,backgroundColor: AppColors.primary,colorText: Color(0xffffffff));
      }
    }else{
      Get.snackbar("عذرا", "حاول لاحقا",backgroundColor: AppColors.primary,colorText: Color(0xffffffff));
    }
    update();
  }

  @override
  void onInit() {
    HomeDio.init();
    getServices();
    // TODO: implement onInit
    super.onInit();
  }
}