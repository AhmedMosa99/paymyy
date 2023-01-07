import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/theme/input_validations.dart';
import 'package:paymyy/core/values/assets/app_icons.dart';
import 'package:paymyy/modules/singup/register_controller.dart';
import 'package:paymyy/modules/singup/widgets/phone_field_widget.dart';
import 'package:paymyy/widgets/text_field_widget.dart';

import 'build_text_widget.dart';

class FirstPageWidget extends StatefulWidget {
  const FirstPageWidget({Key? key}) : super(key: key);

  @override
  State<FirstPageWidget> createState() => _FirstPageWidgetState();
}

class _FirstPageWidgetState extends State<FirstPageWidget> {
  final controller = Get.find<RegisterController>();

  int groupVal = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.firstKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            const TextWidget("work_type"),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 30.w),
              child: Row(
                children: [
                  Radio(
                    activeColor: AppColors.primary,
                    groupValue: groupVal,
                    value: 1,
                    onChanged: (x) {
                      groupVal = x!;
                      setState(() {});
                    },
                  ),
                  Text("single".tr),
                  Radio(
                    activeColor: AppColors.primary,
                    groupValue: groupVal,
                    value: 2,
                    onChanged: (x) {
                      groupVal = x!;
                      setState(() {});
                    },
                  ),
                  Text("organization".tr)
                ],
              ),
            ),
            const TextWidget("org_name"),
            TextFieldWidget(
              validator: (value) => InputValidations.validateName(value),
              controller: controller.orgName,
              hintText: 'شركة الدرعية القابضة  ',
              prefix: AppIcons.orgNameame,
            ),
            const TextWidget("brand_arabic"),
            TextFieldWidget(
              validator: (value) => InputValidations.validateName(value),
              controller: controller.brandArabic,
              hintText: 'شركة الدرعية القابضة  ',
              prefix: AppIcons.orgNameame,
            ),
            const TextWidget("brand_english"),
            TextFieldWidget(
              validator: (value) => InputValidations.validateName(value),
              controller: controller.brandEnglish,
              hintText: 'شركة الدرعية القابضة  ',
              prefix: AppIcons.orgNameame,
            ),
            const TextWidget("org_phone"),
            PhoneFieldWidget(
              controller: controller.phone,
            ),
            SizedBox(
              height: 170.h,
            ),
          ],
        ),
      ),
    );
  }
}
