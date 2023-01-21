import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class footer_widget extends StatelessWidget {
  String title, subtitle;
  Function() function;

  footer_widget(
      {required this.subtitle, required this.title, required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 16.h),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: title,
                style: AppTextStyles.b12.copyWith(color: Colors.black,fontSize: 13.sp,fontWeight: FontWeight.w600,fontFamily: GoogleFonts.tajawal().fontFamily)),
            TextSpan(
                text: " " + subtitle,
                style: AppTextStyles.b12.copyWith(color: AppColors.primary,fontSize: 13.sp,fontWeight: FontWeight.w600,fontFamily: GoogleFonts.tajawal().fontFamily),
                recognizer: TapGestureRecognizer()..onTap = function),
          ],
        ),
      ),
    );
  }
}
