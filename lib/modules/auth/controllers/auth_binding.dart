import 'package:get/get.dart';
import 'package:paymyy/modules/auth/controllers/register_controller.dart';
import 'package:paymyy/modules/profile/controllers/profile_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    Get.put(RegisterController());
  }
}
