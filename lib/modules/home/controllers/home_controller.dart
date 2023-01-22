import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/data/api/home_requests.dart';
import 'package:paymyy/modules/auth/models/banks_model.dart';
import 'package:paymyy/modules/home/models/add_services_model.dart';
import 'package:paymyy/modules/home/models/client_screen.dart';
import 'package:paymyy/modules/home/models/customer_info_model.dart';

import '../../../data/api/auth_requests.dart';
import '../models/services_model.dart';

class HomeController extends GetxController {
  ServicesModel? servicesModel;
  AddServicesModel? addServicesModel;
  CustomersModel? customersModel;
  int count = 1;
  ScrollController? scrollController = ScrollController();
  bool customerLoading = false;
  List<DataCustomer> dataCustomer = [];
  String? nextPage;
  CustomerInfoModel? customerInfoModel;
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController reference = TextEditingController();
  TextEditingController accountNo = TextEditingController();
  TextEditingController ipan = TextEditingController();
  TextEditingController bankName = TextEditingController();
  String? bankSelect;
  int? idBank;
  BanksModel? banksModel;
  final formKey = GlobalKey<FormState>();

  //chooseBank
  chooseBank(String value, int id) {
    bankSelect = value;
    idBank = id;
    update();
  }

  getBanks() async {
    banksModel = await AuthDio.getBanks();
    update();
  }

//services
  getServices() async {
    servicesModel = await HomeDio.getServices();
    update();
  }

  requestServices(id) async {
    addServicesModel = await HomeDio.postServices(id);
    if (addServicesModel != null) {
      if (addServicesModel!.status!) {
        Get.snackbar("تم", addServicesModel!.message!,
            backgroundColor: AppColors.primary, colorText: Color(0xffffffff));
      } else {
        Get.snackbar("عذرا", addServicesModel!.message!,
            backgroundColor: AppColors.primary, colorText: Color(0xffffffff));
      }
    } else {
      Get.snackbar("عذرا", "حاول لاحقا",
          backgroundColor: AppColors.primary, colorText: Color(0xffffffff));
    }
    update();
  }

  //customers
  getCustomer() async {
    customersModel = await HomeDio.getCustomers(count);
    print(customersModel);
    if (customersModel != null) {
      nextPage = customersModel?.data?.nextPageUrl;
      dataCustomer = customersModel!.data!.data!;
      print(dataCustomer.length);
    }
    update();
  }

  getCustomerInfo(int id) async {
    customerInfoModel = await HomeDio.getCustomerInfo(id);
    update();
  }

  void pagination() async {
    if ((scrollController!.position.pixels ==
        scrollController!.position.maxScrollExtent)) {
      if (customersModel != null) {
        if (nextPage != null) {
          customerLoading = true;
          List<DataCustomer> list = [];
          count = count + 1;
          update();
          print(count);
          CustomersModel? x = await HomeDio.getCustomers(count);
          nextPage = x?.data?.nextPageUrl;
          list = x!.data!.data!;
          dataCustomer = dataCustomer + list;
          update();
        } else {
          print("stop");
          customerLoading = false;
          update();
        }
      }
    }
    update();
  }

  addCustomer() async {
    formKey.currentState!.save();
   if(formKey.currentState!.validate()&&idBank!=null){
     var x = await HomeDio.addCustomer(
       accountNumber: accountNo.text,
       email: email.text,
       fulLName: name.text,
       iban: ipan.text,
       bankId: idBank.toString(),
       phoneNumber: mobile.text,
     );
     if(x!.status=="Success"){
     getCustomer();
     }
   }else{
     print("ahmed");
   }
    update();
  }

  @override
  void onInit() {
    AuthDio.init();
    HomeDio.init();
    getCustomer();
    getBanks();
    getServices();
    // TODO: implement onInit
    super.onInit();
  }
}
