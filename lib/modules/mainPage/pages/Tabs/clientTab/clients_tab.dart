import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/values/assets/app_icons.dart';
import '../../../../../routes/app_routes.dart';
class ClientsTab extends StatelessWidget {
  const ClientsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "clients".tr,
          style: AppTextStyles.b20.copyWith(color: Colors.black),
        ),
        toolbarHeight: 80.h,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.newClient);
              }, child: SvgPicture.asset(AppIcons.clientsAdd)),
          SizedBox(
            width: 16.w,
          ),
        ],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (c,i){
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: AppColors.greyd9,width: 0.7)
            ),
            child: Container(
              height: 72.h,
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsetsDirectional.only(start: 16.w),
                    child: Column(
                      children: [
                        Text('سارة محمد الخالد'),
                        Text('+9758985587',style: AppTextStyles.r12.copyWith(color: AppColors.grey87),)
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(end: 16.0),
                    child: Icon(Icons.arrow_forward_ios_outlined,color: AppColors.primary,),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
