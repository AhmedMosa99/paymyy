import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/values/assets/app_icons.dart';
import 'package:paymyy/modules/singup/widgets/phone_field_widget.dart';
import 'package:paymyy/widgets/text_field_widget.dart';

import '../../../core/theme/input_validations.dart';
import '../../../core/values/assets/app_images.dart';
import '../register_controller.dart';
import 'build_text_widget.dart';
class SecondPageWidget extends StatelessWidget {
  final controller = Get.find<RegisterController>();

  SecondPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Form(
        key: controller.secondKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h,),
            TextWidget(  "full_name"),
            TextFieldWidget(validator: (value)=>InputValidations.validateName(value),controller: controller.fullName, hintText: 'سارة محمد الخالد',prefix: AppImages.name,),
            TextWidget( "email"),
            TextFieldWidget(validator: (value)=>InputValidations.validateEmail(value),controller: controller.email, hintText: 'sara@gmail.com',prefix:AppIcons.email,),
            TextWidget(   "mobile_number") ,
            PhoneFieldWidget(controller: controller.mobilePhone),
            TextWidget("password"),
            TextFieldWidget(validator: (value)=>InputValidations.validateName(value),controller: controller.password, hintText:  '•••••••', isPassord: true,
                obscure: true,
                prefix: AppImages.actionPassord,
                suffix: AppIcons.passwordSeen),
            TextWidget(   "passord_confirm"),
            TextFieldWidget(validator: (value)=>InputValidations.validatePassword(value,controller.password.text),controller: controller.passordConfirm, hintText:  '•••••••', isPassord: true,
              obscure: true,
              prefix: AppImages.actionPassord,
              suffix: AppIcons.passwordSeen,),
            SizedBox(height: 130.h,),

          ],
        ),
      ),
    );
  }
}
