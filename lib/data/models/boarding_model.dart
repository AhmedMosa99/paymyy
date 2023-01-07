import 'package:paymyy/core/values/assets/app_images.dart';

class BoardingModel {
  String image;
  String title;

  BoardingModel({required this.title, required this.image});
}

List<BoardingModel> boardings = [
  BoardingModel(title: 'create_links', image: AppImages.b1),
  BoardingModel(title: "payment_collection", image: AppImages.b2),
  BoardingModel(title: "accept_payments", image: AppImages.b3),
  BoardingModel(title: "save_payments", image: AppImages.b4),
  BoardingModel(title: "sale_via_internet", image: AppImages.b5),
  BoardingModel(title: 'shipping_products', image: AppImages.b6),
];
