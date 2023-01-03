import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_colors.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/values/assets/app_icons.dart';
import '../../../../data/models/product_model.dart';
import '../../widgets/sort_sheet_widget.dart';
class ProductsTab extends StatefulWidget {
  const ProductsTab({Key? key}) : super(key: key);

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "products".tr,
          style: AppTextStyles.b20.copyWith(color: Colors.black),
        ),
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
              onTap: () {}, child: SvgPicture.asset(AppIcons.search)),
          SizedBox(
            width: 16.w,
          ),
          GestureDetector(
              onTap: () {
                Get.bottomSheet(
                  SortSheetWidget(),  ignoreSafeArea: true,
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
                  ),);
              }, child: SvgPicture.asset(AppIcons.filter)),
          SizedBox(
            width: 16.w,
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: GridView.builder(
          itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
    itemBuilder: (_, i) {
            final product =products[i];
            return GestureDetector(
              onTap: (){
                setState(() {
                  product.id=!product.id;
                });
              },
              child: Stack(
              children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.whitef3,width: 0.7),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0,2),
                      color: Color.fromARGB(1, 0, 0, 0),
                      spreadRadius: 2
                    )
                  ]
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 97,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(10),topEnd: Radius.circular(10)),
                        image: DecorationImage(image:AssetImage(product.image),fit: BoxFit.fill)
                      ),
                    ),
                    Row(
                      children: [
                        Text(product.name),
                        Spacer(),
                        Text(product.price.toString()+product.currency)
                      ],
                    )
                  ],
                ),
              ),
    Align(
    alignment: AlignmentDirectional.topStart,
    child: Container(
      margin: EdgeInsetsDirectional.only(top: 10.h,start: 10.w),
      width: 17.w,
      height: 17.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.grey87)
      ),
    child: Visibility(
      visible: product.id,
      child: Center(child: Icon(Icons.check,color: AppColors.primary,size: 15,),),
    ),
    ),
    ),
              ],
              ),
            );}

        ),
      ),
    );
  }
}
