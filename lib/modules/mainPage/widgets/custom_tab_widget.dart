import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class CustomTabWidget extends StatelessWidget {
  bool isSelected;
  String name;
  bool isBill;

  CustomTabWidget(
      {required this.name, required this.isSelected, this.isBill = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: isBill ? 3.h : 0.h),
      width: isBill ? 85.w : 150.w,
      height: 30.h,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.greyf8,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(
        name.tr,
        style: AppTextStyles.b12
            .copyWith(color: isSelected ? Colors.white : AppColors.black22),
      )),
    );
  }
}
