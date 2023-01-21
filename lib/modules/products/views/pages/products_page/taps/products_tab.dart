import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/values/assets/app_images.dart';
import 'package:paymyy/data/models/product_model.dart';
import 'package:paymyy/modules/products/models/product.dart';
import 'package:paymyy/modules/products/views/widgets/product_widget.dart';
import 'package:paymyy/routes/app_routes.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Get.toNamed(AppRoutes.addProductPage);
        },
      ),
      body: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 140,
        ),
        itemBuilder: (_, i) => ProductWidget(
          product: Product(
            price: 300,
            name: 'شاحن Apple',
            currency: ' د.ك',
            image: AppImages.productTest,
          ),
        ),
      ),
    );
  }
}
