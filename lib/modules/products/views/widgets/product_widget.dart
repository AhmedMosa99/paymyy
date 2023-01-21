import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/modules/products/models/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // setState(() {
        //   product.id = !product.id;
        // });
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 100.h,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(10),
                            topEnd: Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage(product.image),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        Text(
                          product.price.toString() + product.currency,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Container(
                margin: EdgeInsetsDirectional.only(top: 10.h, start: 10.w),
                width: 17.w,
                height: 17.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.grey87),
                ),
                child: Visibility(
                  visible: product.id,
                  child: Center(
                    child: Icon(
                      Icons.check,
                      color: AppColors.primary,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
