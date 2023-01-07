import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/theme/app_text_styles.dart';

import '../../../core/theme/input_validations.dart';
import '../../../core/values/assets/app_icons.dart';
import '../../../core/values/assets/app_images.dart';
import '../../../widgets/text_field_widget.dart';
import '../register_controller.dart';
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
                type: TextInputType.phone),
            const TextWidget("ipan"),
            TextFieldWidget(
                validator: (value) => InputValidations.validateName(value),
                controller: controller.ipan,
                hintText: '123456',
                prefix: AppIcons.ipan,
                type: TextInputType.phone),
            const TextWidget("bank_name"),
            TextFieldWidget(
              validator: (value) => InputValidations.validateName(value),
              controller: controller.bankName,
              hintText: 'البنك الوطني',
              prefix: AppIcons.bankName,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 25.w),
              child: Row(
                children: [
                  Checkbox(
                      activeColor: AppColors.greyd99,
                      checkColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      value: val,
                      onChanged: (x) {
                        val = x!;
                        setState(() {});
                      }),
                  Text(
                    "agree".tr,
                    style: AppTextStyles.b9.copyWith(color: AppColors.black1e),
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
}
