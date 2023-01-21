import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/theme/app_text_styles.dart';
import 'package:paymyy/widgets/button_widget.dart';

class FilterProductsSheetWidget extends StatefulWidget {
  const FilterProductsSheetWidget({Key? key}) : super(key: key);

  @override
  State<FilterProductsSheetWidget> createState() =>
      _FilterProductsSheetWidgetState();
}

class _FilterProductsSheetWidgetState extends State<FilterProductsSheetWidget> {
  int sort = 1;
  int sortDirection = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 440.h,
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            ListTile(
              trailing: IconButton(
                icon: Icon(
                  Icons.close,
                  color: AppColors.black38,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              title: Text(
                textAlign: TextAlign.center,
                "filter_search".tr,
                style: AppTextStyles.b20,
              ),
            ),
            Container(
                margin: EdgeInsetsDirectional.only(
                    start: 16.w, top: 25.h, bottom: 18.h),
                child: Text(
                  "sort by".tr,
                  style: AppTextStyles.r16.copyWith(color: Colors.black),
                )),
            Row(
              children: [
                Container(
                  width: 10.w,
                  height: 10.h,
                  margin: EdgeInsetsDirectional.only(start: 16.w, end: 8.w),
                  child: Radio(
                    activeColor: AppColors.primary,
                    groupValue: sort,
                    value: 1,
                    onChanged: (x) {
                      setState(() {
                        sort = x!;
                      });
                    },
                  ),
                ),
                Text(
                  "date_created".tr,
                  style: AppTextStyles.r14,
                ),
                Container(
                  width: 10.w,
                  height: 10.h,
                  margin: EdgeInsetsDirectional.only(end: 8.w, start: 16.w),
                  child: Radio(
                    activeColor: AppColors.primary,
                    groupValue: sort,
                    value: 2,
                    onChanged: (x) {
                      setState(() {
                        sort = x!;
                      });
                    },
                  ),
                ),
                Text(
                  "client_name".tr,
                  style: AppTextStyles.r14,
                ),
                Container(
                  width: 10.w,
                  height: 10.h,
                  margin: EdgeInsetsDirectional.only(end: 8.w, start: 16.w),
                  child: Radio(
                    activeColor: AppColors.primary,
                    groupValue: sort,
                    value: 3,
                    onChanged: (x) {
                      setState(() {
                        sort = x!;
                      });
                    },
                  ),
                ),
                Text(
                  "pill_value".tr,
                  style: AppTextStyles.r14,
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 30.h),
                child: Divider(
                  color: AppColors.grey87,
                )),
            Container(
                margin: EdgeInsetsDirectional.only(start: 16.w),
                child: Text(
                  "arrangement_direction".tr,
                  style: AppTextStyles.r16.copyWith(color: Colors.black),
                )),
            Row(
              children: [
                Radio(
                  activeColor: AppColors.primary,
                  groupValue: sortDirection,
                  value: 1,
                  onChanged: (x) {
                    setState(() {
                      sortDirection = x!;
                    });
                  },
                ),
                Text(
                  "ascending".tr,
                  style: AppTextStyles.r14,
                ),
                Radio(
                  activeColor: AppColors.primary,
                  groupValue: sortDirection,
                  value: 2,
                  onChanged: (x) {
                    setState(() {
                      sortDirection = x!;
                    });
                  },
                ),
                Text(
                  "descending".tr,
                  style: AppTextStyles.r14,
                ),
              ],
            ),
            Divider(
              color: AppColors.grey87,
            ),
            SizedBox(
              height: 25.h,
            ),
            Center(child: ButtonWidget(title: 'apply'.tr, function: () {}))
          ],
        ),
      ),
    );
  }
}
