import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/modules/home/controllers/home_controller.dart';


import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/input_validations.dart';
import '../../../../core/values/assets/app_icons.dart';
import '../../../../core/values/assets/app_images.dart';
import '../../../../widgets/button_widget.dart';
import '../../../../widgets/text_field_widget.dart';
import '../../../auth/views/widgets/phone_field_widget.dart';

class ShowCustomerScreen extends StatelessWidget {

  ShowCustomerScreen({Key? key}) : super(key: key);

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
          GetBuilder<HomeController>(
            builder: (logic) {
              return logic.customerInfoModel!.data!.customer!.hasBank==1? buildSecondInformation():Container();
            }
          ),
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
      child: GetBuilder<HomeController>(
        builder: (logic) {
          return SizedBox(
            height: 260.h,
            child: Column(
              children: [
                TextFieldWidget(
                  horozontal: 16,
                  validator: (value) => InputValidations.validateEmail(value),
                  hintText: logic.customerInfoModel!.data!.customerBank!.first.accountNumber!,
                  prefix: AppIcons.ipan,
                ),
                TextFieldWidget(
                  horozontal: 16,
                  validator: (value) => InputValidations.validateEmail(value),
                  hintText: logic.customerInfoModel!.data!.customerBank!.first.iban!,
                  prefix: AppIcons.ipan,
                ),
                TextFieldWidget(
                  horozontal: 16,
                  validator: (value) => InputValidations.validateEmail(value),
                  hintText: logic.customerInfoModel!.data!.customerBank!.first.bankId!.toString(),
                  prefix: AppIcons.bankName,

                ),
              ],
            ),
          );
        }
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
      child: GetBuilder<HomeController>(
        builder: (logic) {
          return Container(
            height: 350.h,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Column(
              children: [
                TextFieldWidget(
                  horozontal: 16,
                  validator: (value) => InputValidations.validateEmail(value),
                  hintText: logic.customerInfoModel!.data!.customer!.fullName!,
                  prefix: AppImages.name,
                ),
                TextFieldWidget(
                  horozontal: 16,
                  validator: (value) => InputValidations.validateEmail(value),
                  hintText: logic.customerInfoModel!.data!.customer!.email!,
                  prefix: AppIcons.email,
                ),
                PhoneFieldWidget(
                  horizontal: 16, controller: TextEditingController(),
                  value: logic.customerInfoModel!.data!.customer!.phoneNumber!,
                ),
                TextFieldWidget(
                  horozontal: 16,
                  validator: (value) => InputValidations.validateEmail(value),
                  hintText: "#${logic.customerInfoModel!.data!.customer!.id}",
                  prefix: AppIcons.clientReference,
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
