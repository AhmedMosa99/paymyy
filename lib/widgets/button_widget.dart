import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
class ButtonWidget extends StatelessWidget {
  String title;
  Function() function;
  ButtonWidget({required this.title,required  this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 271.w,
        height: 50.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.secondary),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.b15.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
}}
