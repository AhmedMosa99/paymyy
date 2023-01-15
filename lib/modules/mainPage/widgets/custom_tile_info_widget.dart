import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_text_styles.dart';
import '../../../routes/app_routes.dart';

class CustomTileInfoWidget extends StatelessWidget {
  String title, val;
  Color color;
  bool isClick;

  CustomTileInfoWidget(
      {required this.title,
      this.isClick = false,
      required this.val,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListTile(
        title: Text(
          title.tr,
          style: AppTextStyles.b12,
        ),
        trailing: GestureDetector(
          onTap: () {
            if (isClick) {
              Get.toNamed(AppRoutes.billDisplay);
            }
          },
          child: Text(
            val,
            style: AppTextStyles.b12.copyWith(color: color),
          ),
        ),
      ),
    );
  }
}
