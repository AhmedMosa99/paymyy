import 'package:get/get.dart';

class ProductsController extends GetxController {
  // notifiable.
  int _selectedTap = 0;

  int get selectedTap => _selectedTap;

  set selectedTap(int value) {
    _selectedTap = value;
    update(['taps']);
  }
}
