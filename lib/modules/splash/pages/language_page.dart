import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/theme/app_text_styles.dart';
import 'package:paymyy/core/values/assets/app_icons.dart';
import 'package:paymyy/core/values/assets/app_images.dart';
import 'package:paymyy/routes/app_routes.dart';

import '../../../data/providers/local_storage.provider.dart';
import '../../../widgets/button_widget.dart';

class LanguagePage extends StatefulWidget {
  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  bool arabic = true, english = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AppImages.background,
                ),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                //  margin: EdgeInsetsDirectional.only(bottom: 51.h,top: 150.h),
                width: 248.w,
                height: 147.h,
                child: Image.asset(
                  AppImages.blueIcon,
                  fit: BoxFit.fill,
                )),
            Container(
              height: 327.h,
              child: Stack(
                children: [
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: AppColors.whitef3, width: 0.7)),
                    child: Container(
                      width: 287.w,
                      height: 307.h,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.black33, offset: const Offset(0, 0)),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsetsDirectional.only(
                                top: 25.h, bottom: 83.h),
                            child: Text(
                              "choose_language".tr,
                              style: AppTextStyles.b16,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildLanguage(
                                  function: () {
                                    LocalStrorageProvider.setLanguage('en');
                                    arabic = false;
                                    english = true;
                                    setState(() {});
                                  },
                                  selected: english,
                                  title: 'English',
                                  icon: AppIcons.en),
                              SizedBox(
                                width: 60.w,
                              ),
                              buildLanguage(
                                  function: () {
                                    LocalStrorageProvider.setLanguage('ar');
                                    arabic = true;
                                    english = false;
                                    setState(() {});
                                  },
                                  selected: arabic,
                                  title: 'اللغة العربية',
                                  icon: AppIcons.ar),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    bottom: 0.h,
                    start: 5.w,
                    child: Container(
                      width: 280.w,
                      child: ButtonWidget(
                          horozontal: 10,
                          title: 'next'.tr,
                          function: () {
                            Get.updateLocale(
                                Locale(LocalStrorageProvider.locale));
                            LocalStrorageProvider.setEnter(true);
                            Get.toNamed(AppRoutes.boarding);
                          }),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildLanguage(
      {required String title,
      required String icon,
      required Function() function,
      required bool selected}) {
    return Column(
      children: [
        GestureDetector(
          onTap: function,
          child: Container(
            width: 65.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: AppColors.greyd9,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    width: 1,
                    color: selected ? AppColors.primary : AppColors.greyd9)),
            child: SvgPicture.asset(icon),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          title,
          style: title == 'English' ? AppTextStyles.b14 : AppTextStyles.b12,
        ),
      ],
    );
  }
}
