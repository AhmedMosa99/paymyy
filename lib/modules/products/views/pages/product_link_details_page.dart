import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paymyy/core/theme/app_colors.dart';

class ProductDetailsLinkPage extends StatefulWidget {
  const ProductDetailsLinkPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsLinkPage> createState() => _ProductDetailsLinkPageState();
}

class _ProductDetailsLinkPageState extends State<ProductDetailsLinkPage> {
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
        title: Text(
          'اضافة رابط منتج',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          const Center(
            child: Text(
              'اضافة',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.h),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    'معلومات رابط المنتج',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          Card(
            margin: EdgeInsets.all(8.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            elevation: 3,
            child: Container(
              padding: EdgeInsets.all(12.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'اسم المنتج بالانجليزي',
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'test',
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'اسم المنتج بالعربي*',
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0.h, horizontal: 12.w),
                      border: _outlinedBorder,
                      enabledBorder: _outlinedBorder,
                      errorBorder: _outlinedBorder,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      const Text(
                        'المنتجات',
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/svgs/products.svg',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      const Text(
                        'مفعل ؟',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
