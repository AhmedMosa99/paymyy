import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/values/assets/app_icons.dart';
import '../../widgets/sort_sheet_widget.dart';

class ReturnedAmountsPage extends StatelessWidget {
  const ReturnedAmountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "returned_amounts".tr,
          style: AppTextStyles.b20.copyWith(color: Colors.black),
        ),
        toolbarHeight: 75.h,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
              onTap: () {}, child: SvgPicture.asset(AppIcons.search)),
          SizedBox(
            width: 16.w,
          ),
          GestureDetector(
              onTap: () {
                Get.bottomSheet(
                  SortSheetWidget(),
                  ignoreSafeArea: true,
                  barrierColor: Colors.black26,
                  isScrollControlled: true,
                  enableDrag: false,
                  isDismissible: false,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(25),
                      topStart: Radius.circular(25),
                    ),
                  ),
                );
              },
              child: SvgPicture.asset(AppIcons.filter)),
          SizedBox(
            width: 16.w,
          ),
        ],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (c, i) => Card(
          margin: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: AppColors.whitef3, width: 0.7)),
          child: Container(
            height: 90.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                    visualDensity: VisualDensity(vertical: -4),
                    leading: Text(
                      'سارة محمد الخالد',
                      style: AppTextStyles.b12,
                    ),
                    trailing: Container(
                      margin: EdgeInsetsDirectional.only(top: 6.h),
                      width: 120.w,
                      height: 37.h,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 12.w),
                              child: SvgPicture.asset(AppIcons.returned)),
                          Text(
                            "return_amount".tr,
                            style:
                                AppTextStyles.r12.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    )),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      '12\10\2022',
                      style: AppTextStyles.r10.copyWith(color: Colors.black),
                    )),
                Divider(
                  color: AppColors.grey87,
                ),
                Container(
                    margin: EdgeInsetsDirectional.only(start: 16.w),
                    child: Text(
                      "full_amount".tr + ' :' + '  10.0 دك',
                      style:
                          AppTextStyles.r12.copyWith(color: AppColors.grey87),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
