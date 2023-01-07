import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/app_text_styles.dart';

class ButtonWidget extends StatelessWidget {
  String title;
  Function() function;
  Color textcolor, bgColor;
  double horozontal;

  ButtonWidget(
      {required this.title,
      required this.function,
      this.textcolor = Colors.white,
      this.horozontal = 36,
      this.bgColor = const Color(0xff009CD9)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horozontal.w),
        height: 50.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: bgColor),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.b15.copyWith(color: textcolor),
          ),
        ),
      ),
    );
  }
}
