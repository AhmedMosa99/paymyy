import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductCreationController extends GetxController {
  File? updatedFile;

  selectProductImage() async {
    XFile file =
        await ImagePicker().pickImage(source: ImageSource.gallery) ?? XFile('');
    this.updatedFile = File(file.path);
    update();
  }
}
