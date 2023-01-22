import 'package:get/get.dart';
import 'package:paymyy/modules/auth/controllers/register_controller.dart';
import 'package:paymyy/modules/home/controllers/home_controller.dart';
import 'package:paymyy/modules/products/controllers/products_controller.dart';
import 'package:paymyy/modules/products/views/pages/products_page/taps/products_categories_tab.dart';
import 'package:paymyy/modules/profile/controllers/profile_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(ProductsController());
  }
}
