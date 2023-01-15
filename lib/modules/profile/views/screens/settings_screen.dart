import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paymyy/core/component/component.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/values/assets/app_icons.dart';
import 'package:paymyy/core/values/assets/app_images.dart';
import 'package:paymyy/routes/app_routes.dart';
import 'package:paymyy/widgets/text_field_widget.dart';

import '../../../../core/theme/input_validations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "settings".tr,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.feesScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.fees,
                          width: 22.w,
                          height: 22.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "fees".tr,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000)),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: (){
                    changePasswordDialog(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.changePassword,
                          width: 22.w,
                          height: 22.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "changePassword".tr,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000)),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    langWidget(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.language,
                          width: 22.w,
                          height: 22.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "lang".tr,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000)),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.socialMediaScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.social,
                          width: 22.w,
                          height: 22.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "socialMedia".tr,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000)),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.discountScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.discount,
                          width: 22.w,
                          height: 22.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "discount".tr,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000)),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.notificationSettingsScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.notificationProfile,
                          width: 22.w,
                          height: 22.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "notificationSettings".tr,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000)),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.privacy,
                        width: 22.w,
                        height: 22.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "privacyPolicy".tr,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000)),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.termScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.term,
                          width: 22.w,
                          height: 22.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "termsAndConditions".tr,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff000000)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void langWidget(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          content: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)),
            height: 145.h,
            width: 337.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                SvgPicture.asset(
                  AppIcons.language,
                  width: 24.w,
                  height: 22.h,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 16,
                ),
                Text("changeTheLanguage".tr,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 73.w,
                        height: 36.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("English",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.primary)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: AppColors.primary),
                                borderRadius:
                                    BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      SizedBox(
                        width: 73.w,
                        height: 36.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("عربي",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: AppColors.primary),
                                borderRadius:
                                    BorderRadius.circular(8)),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
  void changePasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          content: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10)),
            height: 375.h,
            width: 337.w,
            child:  Stack(children: [
              Container(
                height: 355.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color:Color(0xffF3F3F3)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2.sp,
                          color:Colors.grey.shade300,
                          offset: Offset (0,2)
                      ),
                    ]
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 36.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Text("changePassword".tr,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),)),
                     SizedBox(height: 12.h,),
                     Text("currentPassword".tr,style: TextStyle(fontSize: 15.sp,color: Colors.black),),
                      SizedBox(height: 12.h,),
                      defaultFormField(
                          validate: (value) => InputValidations.validatePassword(value!,value),
                          controller: TextEditingController(),
                          hintText: '•••••••',
                          fillColor: Color(0xffF8F8F8),
                          focusColor: Colors.transparent,
                          borderColor: Colors.transparent,
                          prefix: Image.asset(AppImages.actionPassord),
                          suffix: SvgPicture.asset( AppIcons.passwordSeen),type: TextInputType.text),
                      SizedBox(height: 12.h,),
                      Text("newPassword".tr,style: TextStyle(fontSize: 15.sp,color: Colors.black),),
                      SizedBox(height: 12.h,),
                      defaultFormField(
                          validate: (value) => InputValidations.validatePassword(value!,value),
                          controller: TextEditingController(),
                          hintText: '•••••••',
                          fillColor: Color(0xffF8F8F8),
                          focusColor: Colors.transparent,
                          borderColor: Colors.transparent,
                          prefix: Image.asset(AppImages.actionPassord),
                          suffix: SvgPicture.asset( AppIcons.passwordSeen),type: TextInputType.text),
                      SizedBox(height: 12.h,),
                      Text("confirmPassword".tr,style: TextStyle(fontSize: 15.sp,color: Colors.black),),
                      SizedBox(height: 12.h,),
                      defaultFormField(
                          validate: (value) => InputValidations.validatePassword(value!,value),
                          controller: TextEditingController(),
                          hintText: '•••••••',
                          fillColor: Color(0xffF8F8F8),
                          focusColor: Colors.transparent,
                          borderColor: Colors.transparent,
                          prefix: Image.asset(AppImages.actionPassord),
                          suffix: SvgPicture.asset( AppIcons.passwordSeen),type: TextInputType.text),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                    width: 271.5.w,
                    child: ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ), child: Text("ok".tr,)
                    )),
              )
            ],),
          ),
        );
      },
    );
  }


}
