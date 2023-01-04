import 'package:get/get.dart';

class ProfileController extends GetxController{
  bool company=false;
  bool customer=true;
  bool together=true;
  changeRadioCompany(){
    company=true;
    customer=false;
    together=false;
    update();
  }
  changeRadioCustomer(){
    company=false;
    customer=true;
    together=false;
    update();
  }
  changeRadioTogether(){
    company=false;
    customer=false;
    together=true;
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}