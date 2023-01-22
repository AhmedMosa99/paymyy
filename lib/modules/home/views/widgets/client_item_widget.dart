
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_text_styles.dart';
import 'package:paymyy/modules/home/controllers/home_controller.dart';
import 'package:paymyy/modules/home/models/client_screen.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../routes/app_routes.dart';

class ClientItem extends StatelessWidget {
  DataCustomer?dataCustomer;
   ClientItem({
     this.dataCustomer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (logic) {
        return SizedBox(
          height: 72.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(dataCustomer!.fullName!,style: AppTextStyles.r12
                    .copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500)),
                    Text(
                        dataCustomer!.phoneNumber!,
                      style: AppTextStyles.r12
                          .copyWith(color: AppColors.grey87),
                    )
                  ],
                ),
              ),
              Spacer(),
              InkWell(
                onTap: ()async{
                 await logic.getCustomerInfo(dataCustomer!.id!);
                  Get.toNamed(AppRoutes.showCustomerScreen);
                },
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: 16.0),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.primary,
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
