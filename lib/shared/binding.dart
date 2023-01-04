import 'package:get/get.dart';
import 'package:pay_myy/modules/profile/controllers/profile_controller.dart';

import '../modules/payment_links/controllers/payment_link_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(PaymentLinkController());
    Get.put(ProfileController());
  }
}
