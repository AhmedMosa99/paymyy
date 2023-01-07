import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/routes/app_routes.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/values/assets/app_icons.dart';

class PaymentLinkPage extends StatelessWidget {
  const PaymentLinkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "payment_links".tr,
          style: AppTextStyles.b20.copyWith(color: Colors.black),
        ),
        toolbarHeight: 75.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.pillLinkCreate);
        },
        backgroundColor: AppColors.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (c, i) => SizedBox(
          height: 16.h,
        ),
        itemCount: 3,
        itemBuilder: (c, i) => GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.pillLinkDetails);
          },
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: AppColors.greyd9),
            ),
            child: Container(
              height: 72.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    'ssss',
                    style: AppTextStyles.r14.copyWith(color: AppColors.black22),
                  ),
                  const Spacer(),
                  SvgPicture.asset(AppIcons.billLink),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        '4',
                        style:
                            AppTextStyles.r10.copyWith(color: AppColors.grey87),
                      )),
                  SvgPicture.asset(AppIcons.passwordSeen),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
