import 'package:paymyy/core/values/assets/app_images.dart';

class ElectronicModel {
  String name, image;

  ElectronicModel({required this.name, required this.image});
}

List<ElectronicModel> electronics = [
  ElectronicModel(
      image: AppImages.test1, name: 'بطاقات' + '\n' + ' الدفع المحلية'),
  ElectronicModel(image: AppImages.test2, name: 'أجهزة نقاط البيع'),
  ElectronicModel(image: AppImages.test3, name: 'شحن DHL'),
  ElectronicModel(image: AppImages.test4, name: 'هوية المرسل'),
];
