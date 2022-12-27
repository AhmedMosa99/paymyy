import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/app_colors.dart';
class SharedScreenWidget extends StatelessWidget {
double height;
Widget body;
   SharedScreenWidget({required this.body,required this.height});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: AppColors.whitef3, width: 1)),
      child: Container(
        width: 344.w,
        height: height.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: AppColors.black33, offset: Offset(0, 0)),
          ],
          color: Colors.white,
        ),
        child: body,
      ),
    );
  }
}
