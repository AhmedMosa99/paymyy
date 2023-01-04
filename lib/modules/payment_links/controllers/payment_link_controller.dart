import 'package:get/get.dart';

class PaymentLinkController extends GetxController{
  bool isSelected=true;
  bool  isEnglish=false;
  bool isArabic=true;
  changeRadioEnglish(){
    isEnglish=true;
    isArabic=false;
    update();
  }
  changeRadioArabic(){
    isEnglish=false;
    isArabic=true;
    update();
  }
  changeSwitch(bool x){
    isSelected=x;
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}