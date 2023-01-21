import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/modules/products/controllers/products_controller.dart';
import 'package:paymyy/modules/products/views/pages/products_page/taps/products_categories_tab.dart';
import 'package:paymyy/modules/products/views/pages/products_page/taps/products_links_tab.dart';
import 'package:paymyy/modules/products/views/pages/products_page/taps/products_tab.dart';
import 'package:paymyy/modules/products/views/widgets/filter_products_sheet_widget.dart';
import 'package:paymyy/widgets/custom_tab_widget.dart';

import '../../../../../core/values/assets/app_icons.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  // controller.
  late final ProductsController _productsController =
      Get.find<ProductsController>();

  late final _outlinedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide(
      color: Colors.grey.shade100,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'ابحث عن منتج معين',
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding:
                EdgeInsets.symmetric(vertical: 0.h, horizontal: 12.w),
            border: _outlinedBorder,
            enabledBorder: _outlinedBorder,
            errorBorder: _outlinedBorder,
            prefixIcon: Padding(
              padding: EdgeInsets.all(14.h),
              child: SvgPicture.asset(
                AppIcons.search,
              ),
            ),
          ),
        ),
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        actions: [
          SizedBox(
            width: 16.w,
          ),
          GestureDetector(
              onTap: () {
                Get.bottomSheet(
                  const FilterProductsSheetWidget(),
                  ignoreSafeArea: true,
                  barrierColor: Colors.black26,
                  isScrollControlled: true,
                  enableDrag: false,
                  isDismissible: false,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(25),
                      topStart: Radius.circular(25),
                    ),
                  ),
                );
              },
              child: SvgPicture.asset(AppIcons.filter)),
          SizedBox(
            width: 16.w,
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.grey87, width: 0.3),
                color: AppColors.greyf8,
              ),
              child: GetBuilder<ProductsController>(
                id: 'taps',
                builder: (controller) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.selectedTap = 0;
                      },
                      child: CustomTabWidget(
                        isSelected: controller.selectedTap == 0,
                        name: "صنف المنتج",
                        isBill: true,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.selectedTap = 1;
                      },
                      child: CustomTabWidget(
                        isSelected: controller.selectedTap == 1,
                        name: "المنتجات",
                        isBill: true,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.selectedTap = 2;
                      },
                      child: CustomTabWidget(
                        isSelected: controller.selectedTap == 2,
                        name: "روابط المنتجات",
                        isBill: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: GetBuilder<ProductsController>(
                id: 'taps',
                builder: (controller) {
                  if (controller.selectedTap == 0) {
                    return const ProductsCategoriesTab();
                  } else if (controller.selectedTap == 1) {
                    return const ProductsTab();
                  } else if (controller.selectedTap == 2) {
                    return const ProductsLinksTab();
                  }
                  return const Text('something went wrong');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
