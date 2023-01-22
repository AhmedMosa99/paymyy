import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/routes/app_routes.dart';

class ProductsLinksTab extends StatelessWidget {
  const ProductsLinksTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Get.toNamed(AppRoutes.addProductLinkPage);
        },
      ),
      body: ListView.separated(
        itemCount: 3,
        separatorBuilder: (_, index) => SizedBox(
          height: 15.h,
        ),
        itemBuilder: (_, index) => InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.productLinkDetailsPage);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            elevation: 3,
            child: const ListTile(
              title: Text('روابط'),
            ),
          ),
        ),
      ),
    );
  }
}
