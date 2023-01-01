import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_text_styles.dart';
import 'package:paymyy/core/theme/input_validations.dart';
import 'package:paymyy/core/values/assets/app_icons.dart';
import 'package:paymyy/core/values/assets/app_images.dart';
import 'package:paymyy/routes/app_routes.dart';

import '../../../widgets/button_widget.dart';
import '../../../widgets/shared_screen_widget.dart';
import '../login_controller.dart';
import '../widgets/drop_down_widget.dart';
import '../widgets/footer_widget.dart';
import '../../../widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller=   Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GetBuilder<LoginController>(
          init: controller,
          builder: (logic) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        AppImages.background,
                      ),
                      fit: BoxFit.fill)),
              child: Form(
                key: controller.loginKey,
                child: Column(
                  children: [
                    SizedBox(height: 20.h,),
                    DropDownWidget(),
                    Container(
                        margin: EdgeInsetsDirectional.only(
                            bottom: 22.h, top: 20.h),
                        width: 248.w,
                        height: 147.h,
                        child: Image.asset(
                          AppImages.blueIcon,
                          fit: BoxFit.fill,
                        )),
                    buildLogin(),
                    Spacer(),
                    footer_widget(title: "dont_have_account".tr,
                        subtitle: "create_account".tr,
                        function: () {
                          Get.toNamed(AppRoutes.signup);
                        }),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildLogin() {
    return SharedScreenWidget(height: ScreenUtil.defaultSize.height*0.64, body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            margin:
            EdgeInsetsDirectional.only(top: 25.h, bottom: 24.h),
            child: Text(
              "login".tr,
              style: AppTextStyles.mb20,
            ),
          ),
        ),
        buildTitle("email".tr),
        TextFieldWidget(
          horozontal: 26,
          validator: (value)=>InputValidations.validateEmail(value),
          controller: controller.emailController,
          hintText: 'example@gmail.com',
          prefix: AppIcons.email,
        ),
        buildTitle("password".tr),
        TextFieldWidget(
          horozontal: 26,
          validator: (value)=>InputValidations.validateName(value),
            controller: controller.passwordController,
            hintText: '•••••••',
            isPassord: true,
            obscure: true,
            prefix: AppImages.actionPassord,
            suffix: AppIcons.passwordSeen),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.passordReturned);
          },
          child: Container(
              margin: EdgeInsetsDirectional.only(
                  start: 190.w, bottom: 30.h),
              child: Text("forgot_password".tr)),
        ),
        ButtonWidget(
          horozontal: 26,
            title: "login".tr,
            function: () {
              if(controller.loginKey.currentState!.validate()){
                Get.offAllNamed(AppRoutes.mainPage);
              }
            }),
      ],
    ),);
  }

  Container buildTitle(String title) {
    return Container(
        margin: EdgeInsetsDirectional.only(start: 35.w),
        child: Text(
          title,
          style: AppTextStyles.b15.copyWith(color: Colors.black),
        ));
  }
}
