import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';

class ItemSettingsWidget extends StatelessWidget {
  const ItemSettingsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 50.h,
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
          Text("انشاء فاتورة",style: TextStyle(fontSize: 14.sp,color:AppColors.primary,fontWeight: FontWeight.w600),),
          SizedBox(
            width: 30.w,
            child: Transform.scale(scale: .6,
                child: Switch.adaptive(value: true, onChanged: (newValue) {},),),
          )
        ],
      ),
    );
  }
}