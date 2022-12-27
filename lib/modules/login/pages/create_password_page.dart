import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/modules/login/login_controller.dart';
import 'package:paymyy/routes/app_routes.dart';
import 'package:paymyy/widgets/button_widget.dart';

import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/input_validations.dart';
import '../../../core/values/assets/app_icons.dart';
import '../../../core/values/assets/app_images.dart';
import '../../../widgets/shared_screen_widget.dart';
import '../../../widgets/text_field_widget.dart';
import '../../singup/widgets/build_text_widget.dart';

class CreatePasswordPage extends StatelessWidget {
  CreatePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=   Get.find<LoginController>();

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            toolbarHeight: 130.h,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              "create_pass".tr,
              style: AppTextStyles.mb20.copyWith(color: Colors.black),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            elevation: 0,
          ),
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      AppImages.background,
                    ),
                    fit: BoxFit.fill)),
            child: Stack(
              children: [
                Form(
                  key: controller.passwordConfirm,
                  child: Column(
                    children: [
                      SizedBox(height: 90.h,),
                      Text(   "strong_pass".tr),
                      SizedBox(height: 26.h,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: SharedScreenWidget(
                          body: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 62.h,),
                              TextWidget("password"),
                              TextFieldWidget(
                                  validator: (value)=>InputValidations.validateName(value),
                                  controller: controller.password, hintText:  '•••••••', isPassord: true,
                                  obscure: true,
                                  prefix: AppImages.actionPassord,
                                  suffix: AppIcons.passwordSeen),
                              TextWidget(   "passord_confirm"),
                              TextFieldWidget(
                                validator: (value)=>InputValidations.validatePassword(value,controller.password.text),
                                controller: controller.passordConfirm, hintText:  '•••••••', isPassord: true,
                                obscure: true,
                                prefix: AppImages.actionPassord,
                                suffix: AppIcons.passwordSeen,),
                            ],
                          ),
                          height: ScreenUtil.defaultSize.height*0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                PositionedDirectional(
                  bottom: 270.h,
                  start: 55.w,
                  child: ButtonWidget(title:     "confirm".tr, function: (){
                    if(controller.passwordConfirm.currentState!.validate())
                    Get.offAllNamed(AppRoutes.login);
                  }),
                )
              ],
            ),
          ),
        ));
  }
}