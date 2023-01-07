import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/modules/login/login_controller.dart';
import 'package:paymyy/routes/app_routes.dart';
import 'package:paymyy/widgets/button_widget.dart';
import 'package:pinput/pinput.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/values/assets/app_images.dart';
import '../../../widgets/shared_screen_widget.dart';
import '../../singup/widgets/build_text_widget.dart';

class CodeCheckPage extends StatelessWidget {
  CodeCheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 130.h,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "code_check".tr,
          style: AppTextStyles.mb20.copyWith(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
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
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AppImages.background,
                ),
                fit: BoxFit.fill)),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 90.h,
                ),
                Text("code_received".tr),
                SizedBox(
                  height: 26.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SharedScreenWidget(
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 62.h,
                        ),
                        TextWidget("code_enter".tr),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 30.w, top: 16.h),
                          child: Pinput(
                            autofocus: true,
                            length: 4,
                            focusNode: controller.pinPutFocusNode,
                            controller: controller.pinPutController,
                            pinAnimationType: PinAnimationType.fade,
                            submittedPinTheme: AppTextStyles.defaultPinTheme,
                            focusedPinTheme:
                                AppTextStyles.defaultPinTheme.copyWith(
                              decoration: AppTextStyles
                                  .defaultPinTheme.decoration
                                  ?.copyWith(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: AppColors.secondary),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    height: ScreenUtil.defaultSize.height * 0.4,
                  ),
                ),
              ],
            ),
            PositionedDirectional(
              bottom: 330.h,
              start: 45.w,
              child: Container(
                width: 280.w,
                child: ButtonWidget(
                    horozontal: 0,
                    title: "continue".tr,
                    function: () {
                      Get.toNamed(AppRoutes.createPassword);
                    }),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
