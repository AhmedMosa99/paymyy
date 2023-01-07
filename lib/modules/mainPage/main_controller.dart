import 'package:get/get.dart';

class MainController extends GetxController {
  int currentTab = 0;

  setCurrentTab(int index) {
    currentTab = index;
    update();
  }

  bool isDrawer = false;

  setDrawerOPen(bool x) {
    if (x) {
      isDrawer = true;
    } else {
      isDrawer = false;
    }
    update();
  }
}
