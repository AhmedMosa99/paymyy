import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get_storage/get_storage.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
  //  Get.put(Controller(), permanent: true);

  }
  static initAsyncDependencies() async {
    await GetStorage.init();
  }
}