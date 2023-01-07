import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/theme/app_text_styles.dart';
import 'package:paymyy/core/theme/input_validations.dart';
import 'package:paymyy/widgets/text_field_widget.dart';

import '../../widgets/custom_tile_info_widget.dart';

class BillLinkDetailsPage extends StatefulWidget {
  BillLinkDetailsPage({Key? key}) : super(key: key);

  @override
  State<BillLinkDetailsPage> createState() => _BillLinkDetailsPageState();
}

class _BillLinkDetailsPageState extends State<BillLinkDetailsPage> {
  bool val = false;

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
          "payments_link_details".tr,
          style: AppTextStyles.b20.copyWith(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 75.h,
        elevation: 0,
        actions: [
          Container(
              margin: EdgeInsetsDirectional.only(end: 16.w, top: 26.h),
              child: Text(
                'cancel'.tr,
                style: AppTextStyles.r14.copyWith(color: Colors.black),
              )),
        ],
      ),
      body: ListView(
        children: [
          Container(
              margin: EdgeInsetsDirectional.only(start: 16.w),
              child: Text(
                "payments_link_details".tr,
                style: AppTextStyles.b14.copyWith(color: AppColors.primary),
              )),
          Divider(
            color: AppColors.grey87,
          ),
          CustomTileInfoWidget(title: "link_addres", val: "sss"),
          CustomTileInfoWidget(title: "pill_value", val: "500.00د.ك"),
          CustomTileInfoWidget(
              title: "bill_reference_details", val: "3004850000"),
          CustomTileInfoWidget(
            title: "payment_link",
            val: "http://jfjojjjjgjjjjjgjk[horf",
            color: AppColors.primary,
          ),
          CustomTileInfoWidget(
            title: "date_created",
            val: "1\12\2022",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(
                  "active?".tr,
                  style: AppTextStyles.r14,
                ),
                const Spacer(),
                Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                      activeColor: AppColors.primary,
                      value: val,
                      onChanged: (value) {
                        val = value;
                        setState(() {});
                      }),
                )
              ],
            ),
          ),
          Divider(
            color: AppColors.grey87,
          ),
          Container(
              margin: EdgeInsetsDirectional.only(start: 16.w),
              child: Text(
                'notes'.tr,
                style: AppTextStyles.ul14,
              )),
          TextFieldWidget(
            horozontal: 20,
            validator: (value) => InputValidations.validateName(value),
            controller: TextEditingController(),
            hintText: '',
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
