import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

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
                style: AppTextStyles.b12.copyWith(color: Colors.black)),
            TextSpan(
                text: " " + subtitle,
                style: AppTextStyles.b12.copyWith(color: AppColors.primary),
                recognizer: TapGestureRecognizer()..onTap = function),
          ],
        ),
      ),
    );
  }
}
