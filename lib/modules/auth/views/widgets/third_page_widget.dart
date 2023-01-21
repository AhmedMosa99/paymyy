import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/theme/app_text_styles.dart';

import '../../../../core/component/component.dart';
import '../../../../core/theme/input_validations.dart';
import '../../../../core/values/assets/app_icons.dart';
import '../../../../core/values/assets/app_images.dart';
import '../../../../widgets/text_field_widget.dart';
import '../../controllers/register_controller.dart';
import 'build_text_widget.dart';

class ThirdPageWidget extends StatefulWidget {
  ThirdPageWidget({Key? key}) : super(key: key);

  @override
  State<ThirdPageWidget> createState() => _ThirdPageWidgetState();
}

class _ThirdPageWidgetState extends State<ThirdPageWidget> {
  final controller = Get.find<RegisterController>();

  bool val = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (logic) {
        return SingleChildScrollView(
          child: Form(
            key: controller.thirdKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                const TextWidget("name_of_bank_account"),
                TextFieldWidget(
                  validator: (value) => InputValidations.validateName(value),
                  controller: controller.accountNameOwener,
                  hintText: 'سارة محمد الخالد',
                  prefix: AppImages.name,
                ),
                const TextWidget("account_no"),
                TextFieldWidget(
                    validator: (value) => InputValidations.validateName(value),
                    controller: controller.accountNumber,
                    hintText: '123456',
                    prefix: AppIcons.ipan,
                    type: TextInputType.text),
                const TextWidget("ipan"),
                TextFieldWidget(
                    validator: (value) => InputValidations.validateName(value),
                    controller: controller.iban,
                    hintText: '123456',
                    prefix: AppIcons.ipan,
                    type: TextInputType.text),
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
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 25.w),
                  child: Row(
                    children: [
                      Checkbox(
                          activeColor: AppColors.primary,
                          checkColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          value: logic.val,
                          onChanged: (x) {
                          logic.onChangedCheck(x);
                          }),
                      Text(
                        "agree".tr,
                        style: AppTextStyles.b9.copyWith(color: AppColors.black1e,fontSize: 12.sp),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 170.h,
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
