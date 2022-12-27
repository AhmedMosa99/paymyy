import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_text_styles.dart';
import 'package:paymyy/core/values/assets/app_images.dart';
class FourPageWidget extends StatelessWidget {
  const FourPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 80.h,),
       Image.asset(AppImages.success),
        SizedBox(height: 37.h,),
        Text( "register_success".tr,style: AppTextStyles.b15,),
      ],
    );
  }
}
