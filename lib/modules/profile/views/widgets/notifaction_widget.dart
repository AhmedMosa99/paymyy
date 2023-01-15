import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/values/assets/app_icons.dart';

class ItemNotification extends StatelessWidget {
  const ItemNotification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text("Your account has been Deposited with 19.250 ",style: TextStyle(fontSize: 14.sp,color: Colors.black),)),
            SizedBox(height: 10.h,),
            Text(" 03:30  1\12\2022",style: TextStyle(fontSize: 10.sp),),
        ],
      ),
    );
  }
}