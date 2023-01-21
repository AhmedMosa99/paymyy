import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/values/assets/app_icons.dart';
import 'package:paymyy/modules/auth/views/widgets/phone_field_widget.dart';
import 'package:paymyy/widgets/text_field_widget.dart';
import '../../../../core/component/component.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/input_validations.dart';
import '../../../../core/values/assets/app_images.dart';
import '../../controllers/register_controller.dart';
import 'build_text_widget.dart';

class SecondPageWidget extends StatelessWidget {
  final controller = Get.find<RegisterController>();

  SecondPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (logic) {
      return SingleChildScrollView(
        child: Form(
          key: controller.secondKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              const TextWidget("full_name"),
              TextFieldWidget(
                validator: (value) => InputValidations.validateName(value),
                controller: controller.fullName,
                hintText: 'سارة محمد الخالد',
                prefix: AppImages.name,
              ),
              const TextWidget("email"),
              TextFieldWidget(
                validator: (value) => InputValidations.validateEmail(value),
                controller: controller.email,
                hintText: 'sara@gmail.com',
                prefix: AppIcons.email,
              ),
              const TextWidget("mobile_number"),
              PhoneFieldWidget(controller: controller.mobilePhone),
              const TextWidget("password"),
              TextFieldWidget(
                  validator: (value) => InputValidations.validateName(value),
                  controller: controller.password,
                  hintText: '•••••••',
                  isPassord: true,
                  obscure: true,
                  prefix: AppImages.actionPassord,
                  suffix: AppIcons.passwordSeen),
              const TextWidget("passord_confirm"),
              TextFieldWidget(
                validator: (value) => InputValidations.validatePassword(
                    value, controller.password.text),
                controller: controller.passordConfirm,
                hintText: '•••••••',
                isPassord: true,
                obscure: true,
                prefix: AppImages.actionPassord,
                suffix: AppIcons.passwordSeen,
              ),
              logic.isLoading? SizedBox(height: 10.h,):Container(),
              logic.isLoading?    Center(
                child: CircularProgressIndicator(color: AppColors.primary,),
              ):Container(),
              SizedBox(
                height: 200.h,
              ),
            ],
          ),
        ),
      );
    });
  }
}
