import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class ItemDiscountWidget extends StatelessWidget {
  const ItemDiscountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 72.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Color(0xffD9D9D9)),
          boxShadow: [
            BoxShadow(
                blurRadius: 2.sp,
                color:Colors.grey.shade300,
                offset: Offset (0,2)
            ),
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/images/Vector.png',width: 27.w,height: 27.h,fit: BoxFit.fill,),
              SizedBox(width: 15.w,),
              Text("1500.0د.ك",style: TextStyle(fontSize: 18.sp,color:Colors.black,fontWeight: FontWeight.w600),),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("نسبة الكي نت",style: TextStyle(fontSize: 12.sp,color:Colors.black,fontWeight: FontWeight.w600),),
            SizedBox(height: 12.h,),
            Text("1.75%",style: TextStyle(fontSize: 12.sp,color:AppColors.primary,fontWeight: FontWeight.w600,),),

          ],)
        ],
      ),
    );
  }
}