import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/theme/app_text_styles.dart';
import 'package:paymyy/core/values/assets/app_icons.dart';
import 'package:paymyy/data/providers/local_storage.provider.dart';
import 'package:paymyy/modules/singup/register_controller.dart';
import 'package:paymyy/routes/app_routes.dart';
import 'package:paymyy/widgets/button_widget.dart';

import '../../../core/values/assets/app_images.dart';
import '../../../data/enums/stepper.dart';
import '../../../data/models/stepper_model.dart';
import '../../../widgets/shared_screen_widget.dart';
import '../widgets/first_page_widget.dart';
import '../widgets/four_page_widget.dart';
import '../widgets/second_page_widget.dart';
import '../widgets/third_page_widget.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  RegisterController controller = Get.put(RegisterController());

  @override
  void initState() {
    super.initState();
    Get.put(RegisterController());
  }

  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 130.h,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "create_an_account".tr,
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
      body: GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (logic) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      AppImages.background,
                    ),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(
                      top: 140.h, bottom: 20.h, start: 50.w, end: 50.w),
                  child: Row(
                    children: [
                      buildStepper(model: steps[0]),
                      Expanded(
                          child: Divider(
                        color: Colors.grey,
                      )),
                      buildStepper(model: steps[1]),
                      Expanded(child: Divider(color: Colors.grey)),
                      buildStepper(model: steps[2]),
                      Expanded(child: Divider(color: Colors.grey)),
                      buildStepper(model: steps[3]),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.defaultSize.height * 0.84,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(top: 50.h),
                        child: SharedScreenWidget(
                          height: ScreenUtil.defaultSize.height * 0.7,
                          body: getBody(),
                        ),
                      ),
                      PositionedDirectional(
                          top: 0.h,
                          end: 120.w,
                          child: GestureDetector(
                            onTap: () {
                              logic.selectProfileImage();
                            },
                            child: selectProfile(logic),
                          )),
                      PositionedDirectional(
                          start: 38.w, bottom: 0.h, child: getButton())
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  nextStep() {
    steps[currentStep].state = StepperState.Completed;
    steps[currentStep + 1].state = StepperState.current;
  }

  previousStep() {
    steps[currentStep].state = StepperState.notReached;
    steps[currentStep - 1].state = StepperState.current;
  }

  Container buildStepper({required StepperModel model}) {
    return Container(
      width: 33.w,
      height: 33.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: model.state == StepperState.Completed
              ? Colors.blue
              : model.state == StepperState.current
                  ? Colors.grey
                  : Colors.white,
          border: Border.all(
            color: model.state == StepperState.Completed
                ? Colors.blue
                : model.state == StepperState.current
                    ? Colors.blue
                    : Colors.grey,
          )),
      child: Align(
        alignment: Alignment.center,
        child: Text(model.num.toString()),
      ),
    );
  }

  Widget selectProfile(RegisterController logic) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: logic.updatedFile == null
          ? Stack(
              children: [
                Image.asset(AppImages.profile),
                PositionedDirectional(
                  bottom: 15.h,
                  start: 0.h,
                  child: Container(
                      width: 22.w,
                      height: 22.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: SvgPicture.asset(
                        AppIcons.edit,
                        fit: BoxFit.scaleDown,
                      )),
                ),
              ],
            )
          : CircleAvatar(backgroundImage: FileImage(logic.updatedFile!)),
    );
  }

  Widget getBody() {
    switch (currentStep) {
      case 0:
        return FirstPageWidget();
      case 1:
        return SecondPageWidget();
      case 2:
        return ThirdPageWidget();
      case 3:
        return FourPageWidget();
      default:
        return FirstPageWidget();
    }
  }

  Widget getButton() {
    switch (currentStep) {
      case 0:
        return Container(
          width: 280.w,
          child: ButtonWidget(
            horozontal: 0,
            title: 'next'.tr,
            function: () {
              if (controller.firstKey.currentState!.validate())
                setState(() {
                  nextStep();
                  currentStep++;
                });
            },
          ),
        );
      case 1:
        return CustomRow('next', () {
          if (controller.secondKey.currentState!.validate())
            setState(() {
              nextStep();
              currentStep++;
            });
        });
      case 2:
        return CustomRow("register", () {
          if (controller.thirdKey.currentState!.validate())
            setState(() {
              nextStep();
              currentStep++;
            });
        });
      case 3:
        return Container(
          width: 280.w,
          child: ButtonWidget(
            horozontal: 0,
            title: "log_home".tr,
            function: () {
              {
                Get.offAllNamed(AppRoutes.mainPage);
              }
            },
          ),
        );
      default:
        return Container(
          width: 280.w,
          child: ButtonWidget(
            horozontal: 0,
            title: 'next'.tr,
            function: () {
              setState(() {
                nextStep();
                currentStep++;
              });
            },
          ),
        );
    }
  }

  Widget CustomRow(String next, Function() function) {
    BoxDecoration decoration1 = BoxDecoration(
      color: LocalStrorageProvider.locale == 'en.dart'
          ? Colors.white
          : AppColors.primary,
      border: Border.all(color: AppColors.grey87, width: 0.5),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
    );
    BoxDecoration decoration2 = BoxDecoration(
      color: LocalStrorageProvider.locale == 'en.dart'
          ? AppColors.primary
          : Colors.white,
      border: Border.all(color: AppColors.grey87, width: 0.5),
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
    );
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              previousStep();
              currentStep--;
            });
          },
          child: Container(
            width: 135.w,
            height: 40.h,
            decoration: LocalStrorageProvider.locale == 'en.dart'
                ? decoration1
                : decoration2,
            child: Center(
              child: Text(
                'previous'.tr,
                style: AppTextStyles.b15.copyWith(color: Colors.black),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: function,
          child: Container(
            width: 135.w,
            height: 40.h,
            decoration: LocalStrorageProvider.locale == 'en.dart'
                ? decoration2
                : decoration1,
            child: Center(
              child: Text(
                next.tr,
                style: AppTextStyles.b15.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
