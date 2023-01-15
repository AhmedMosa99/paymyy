import 'package:get/get.dart';

class ProfileController extends GetxController{
 String group="company";
 onChangeRadio(String value){
   group=value;
   update();
 }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}