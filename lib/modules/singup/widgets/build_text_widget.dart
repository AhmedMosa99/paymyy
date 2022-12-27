import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_text_styles.dart';
class TextWidget extends StatelessWidget {
  final String title;
  const TextWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.only(start: 40.w),
        child: Text(title.tr,style: AppTextStyles.b15,));
  }
}
