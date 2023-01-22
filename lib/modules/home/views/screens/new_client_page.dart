import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/modules/home/controllers/home_controller.dart';
import '../../../../core/component/component.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/input_validations.dart';
import '../../../../core/values/assets/app_icons.dart';
import '../../../../core/values/assets/app_images.dart';
import '../../../../widgets/button_widget.dart';
import '../../../../widgets/text_field_widget.dart';
import '../../../auth/views/widgets/build_text_widget.dart';
import '../../../auth/views/widgets/phone_field_widget.dart';

class NewClientScreen extends StatelessWidget {


  NewClientScreen({Key? key}) : super(key: key);

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
      body: GetBuilder<HomeController>(
        builder: (logic) {
          return Form(
            key: logic.formKey,
            child: ListView(
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
                ButtonWidget(function: () {
                  logic.addCustomer();
                }, title: "add_client".tr),
              ],
            ),
          );
        }
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
            height: 300.h,
            child: Column(
              children: [
                TextFieldWidget(
                  horozontal: 16,
                  validator: (value) => InputValidations.validateName(value),
                  controller: logic.accountNo,
                  hintText: "account_no".tr,
                  prefix: AppIcons.ipan,
                ),
                TextFieldWidget(
                  horozontal: 16,
                  validator: (value) => InputValidations.validateName(value),
                  controller:logic. ipan,
                  hintText: "ipan".tr,
                  prefix: AppIcons.ipan,
                ),

                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                        StatefulBuilder(
                            builder: (context,state) {
                              return Container(
                                height:
                                MediaQuery.of(context).size.height - 70.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12))),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.h, horizontal: 12.w),
                                      height: 40.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                        ),
                                        color: AppColors.primary,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.clear,
                                            color: Colors.white,
                                            size: 25.w,
                                          ),
                                          Expanded(
                                            child: defaultFormField(
                                                controller: null,
                                                type: TextInputType.text,
                                                fillColor: Colors.white,
                                                prefix: Icon(
                                                  Icons.search,
                                                  color: Colors.grey,
                                                  size: 20.w,
                                                ),
                                                hintText: "البحث في البنك",
                                                hintStyle:
                                                TextStyle(fontSize: 14.sp),
                                                writeFontSize: 14.sp,
                                                textAlignVertical:
                                                TextAlignVertical.center),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Flexible(
                                      child: ListView.separated(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.w, vertical: 10.h),
                                          itemBuilder: (c, i) {
                                            return InkWell(
                                                onTap: () {
                                                  logic.chooseBank(
                                                      logic
                                                          .banksModel!
                                                          .data![i]
                                                          .name!,
                                                      logic
                                                          .banksModel!
                                                          .data![i]
                                                          .id!);
                                                  logic.update();
                                                  Get.back();
                                                },
                                                child: Text(logic
                                                    .banksModel!
                                                    .data![i]
                                                    .name!));
                                          },
                                          separatorBuilder: (c, i) {
                                            return Divider();
                                          },
                                          itemCount: logic
                                              .banksModel!.data!.length),
                                    )
                                  ],
                                ),
                              );
                            }
                        ),
                        isScrollControlled: true);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget("bank_name"),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 32.w),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(logic.bankSelect??""),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 18.w,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 32.w),
                          child: Divider(
                            color:logic.bankSelect!=null?Colors.grey.shade300: Colors.red,
                            thickness: .7,
                          ),
                        ),
                      ],
                    ),
                  ),
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
            height: 310.h,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Column(
              children: [
                TextFieldWidget(
                  horozontal: 16,
                  validator: (value) => InputValidations.validateName(value),
                  controller: logic.name,
                  hintText: 'full_name'.tr,
                  prefix: AppImages.name,
                ),
                TextFieldWidget(
                  horozontal: 16,
                  validator: (value) => InputValidations.validateName(value),
                  controller: logic.email,
                  hintText: 'example@gmail.com',
                  prefix: AppIcons.email,
                ),
                PhoneFieldWidget(
                  controller:logic. mobile,
                  horizontal: 16,
                ),
                // TextFieldWidget(
                //   horozontal: 16,
                //   validator: (value) => InputValidations.validateEmail(value),
                //   controller: logic.reference,
                //   hintText: "client_reference".tr,
                //   prefix: AppIcons.clientReference,
                // ),
              ],
            ),
          );
        }
      ),
    );
  }
}
