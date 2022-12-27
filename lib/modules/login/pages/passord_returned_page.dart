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

class PassordReturnedPage extends StatelessWidget {
   PassordReturnedPage({Key? key}) : super(key: key);

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
                "pass_restore".tr,
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
                key: controller.passwordKey,
                child: Column(
                  children: [
                    SizedBox(height: 140.h,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SharedScreenWidget(
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:EdgeInsets.symmetric(vertical: 30.h),
                                child: Image.asset(AppImages.passwordReturned)),
                            Padding(
                              padding: EdgeInsetsDirectional.only(start: 25.w),
                              child: Text( "pas_instructions".tr,style: AppTextStyles.b18,textAlign: TextAlign.center,),
                            ),
                            SizedBox(height: 45.h,),
                            TextWidget("email".tr),
                            TextFieldWidget(
                              validator: (value)=>InputValidations.validateEmail(value),
                              controller: controller.emailReturned,
                              hintText: 'example@gmail.com',
                              prefix: AppIcons.email,
                            ),
                          ],
                        ),
                        height: ScreenUtil.defaultSize.height*0.8,
                      ),
                    ),
                  ],
                ),
              ),
              PositionedDirectional(
                bottom: 50.h,
                start: 55.w,
                child: ButtonWidget(title:   "send".tr, function: (){
                  if(controller.passwordKey.currentState!.validate())
                  Get.toNamed(AppRoutes.codeCheck);
                }),
              )
            ],
          ),
        ),
        ));
  }
}
