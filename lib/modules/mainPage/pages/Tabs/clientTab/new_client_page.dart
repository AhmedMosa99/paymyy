import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/modules/singup/widgets/phone_field_widget.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/theme/input_validations.dart';
import '../../../../../core/values/assets/app_icons.dart';
import '../../../../../core/values/assets/app_images.dart';
import '../../../../../widgets/button_widget.dart';
import '../../../../../widgets/text_field_widget.dart';

class NewClientPage extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController reference = TextEditingController();
  TextEditingController accountNo = TextEditingController();
  TextEditingController ipan = TextEditingController();
  TextEditingController bankName = TextEditingController();

  NewClientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "new_client".tr,
          style: AppTextStyles.b20.copyWith(color: Colors.black),
        ),
        toolbarHeight: 70.h,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
              margin: EdgeInsetsDirectional.only(start: 16.w),
              child: Text(
                "client_info".tr,
                style: AppTextStyles.b14.copyWith(color: AppColors.primary),
              )),
          buildFirstInformation(),
          Container(
              margin: EdgeInsetsDirectional.only(start: 16.w),
              child: Text(
                "bank_details".tr,
                style: AppTextStyles.b14.copyWith(color: AppColors.primary),
              )),
          buildSecondInformation(),
          ButtonWidget(function: () {}, title: "add_client".tr),
        ],
      ),
    );
  }

  Card buildSecondInformation() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: AppColors.whitef3, width: 0.7),
      ),
      child: Container(
        height: 260.h,
        child: Column(
          children: [
            TextFieldWidget(
              horozontal: 16,
              validator: (value) => InputValidations.validateEmail(value),
              controller: accountNo,
              hintText: "account_no".tr,
              prefix: AppIcons.ipan,
            ),
            TextFieldWidget(
              horozontal: 16,
              validator: (value) => InputValidations.validateEmail(value),
              controller: ipan,
              hintText: "ipan".tr,
              prefix: AppIcons.ipan,
            ),
            TextFieldWidget(
              horozontal: 16,
              validator: (value) => InputValidations.validateEmail(value),
              controller: bankName,
              hintText: "bank_name".tr,
              prefix: AppIcons.bankName,
              suffix: AppIcons.dropdown,
            ),
          ],
        ),
      ),
    );
  }

  Card buildFirstInformation() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: AppColors.whitef3, width: 0.7),
      ),
      child: Container(
        height: 350.h,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Column(
          children: [
            TextFieldWidget(
              horozontal: 16,
              validator: (value) => InputValidations.validateEmail(value),
              controller: name,
              hintText: 'full_name'.tr,
              prefix: AppImages.name,
            ),
            TextFieldWidget(
              horozontal: 16,
              validator: (value) => InputValidations.validateEmail(value),
              controller: email,
              hintText: 'example@gmail.com',
              prefix: AppIcons.email,
            ),
            PhoneFieldWidget(
              controller: mobile,
              horizontal: 16,
            ),
            TextFieldWidget(
              horozontal: 16,
              validator: (value) => InputValidations.validateEmail(value),
              controller: reference,
              hintText: "client_reference".tr,
              prefix: AppIcons.clientReference,
            ),
          ],
        ),
      ),
    );
  }
}
