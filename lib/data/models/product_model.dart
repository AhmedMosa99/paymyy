import 'package:paymyy/core/values/assets/app_images.dart';

class ProductModel {
  String name, image;
  num price;
  String currency;
  bool id = false;

  ProductModel(
      {required this.price,
      this.id = false,
      required this.name,
      required this.currency,
      required this.image});
}

List<ProductModel> products = [
  ProductModel(
      price: 300,
      name: 'شاحن Apple',
      currency: ' د.ك',
      image: AppImages.productTest),
  ProductModel(
      price: 300,
      name: 'شاحن Apple',
      currency: ' د.ك',
      image: AppImages.productTest),
  ProductModel(
      price: 300,
      name: 'شاحن Apple',
      currency: ' د.ك',
      image: AppImages.productTest),
  ProductModel(
      price: 300,
      name: 'شاحن Apple',
      currency: ' د.ك',
      image: AppImages.productTest),
  ProductModel(
      price: 300,
      name: 'شاحن Apple',
      currency: ' د.ك',
      image: AppImages.productTest),
];
