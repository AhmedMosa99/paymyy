import 'package:get/get.dart';

class MainController extends GetxController{
  int currentTab = 0;
  setCurrentTab(int index){
    currentTab=index;
    update();
  }
}