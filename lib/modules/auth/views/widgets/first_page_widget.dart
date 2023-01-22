import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/component/component.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/theme/input_validations.dart';
import 'package:paymyy/core/values/assets/app_icons.dart';
import 'package:paymyy/modules/auth/controllers/register_controller.dart';
import 'package:paymyy/modules/auth/views/widgets/phone_field_widget.dart';
import 'package:paymyy/widgets/text_field_widget.dart';
import 'build_text_widget.dart';

class FirstPageWidget extends StatefulWidget {
  const FirstPageWidget({Key? key}) : super(key: key);

  @override
  State<FirstPageWidget> createState() => _FirstPageWidgetState();
}

class _FirstPageWidgetState extends State<FirstPageWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (logic) {
        return SingleChildScrollView(
          child: Form(
            key: logic.firstKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                const TextWidget("work_type"),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 30.w),
                  child: Row(
                    children: [
                      Radio(
                        activeColor: AppColors.primary,
                        groupValue: logic.groupVal,
                        value: 1,
                          onChanged: (v){logic.onChangedValue(v!);}
                      ),
                      Text(
                        "single".tr,
                        style:
                            TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                      ),
                      Radio(
                        activeColor: AppColors.primary,
                          groupValue: logic.groupVal,
                        value: 2,
                        onChanged: (v){logic.onChangedValue(v!);}
                      ),
                      Text("organization".tr,
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
              logic.  groupVal == 1
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextWidget("brand_arabic"),
                          TextFieldWidget(
                           // errorText: logic.stepOneModel?.data==null?logic.stepOneModel?.data?.arabicName!.first:"",
                            validator: (value) =>
                                InputValidations.validateName(value),
                            controller: logic.brandArabic,
                            hintText: 'شركة الدرعية القابضة  ',
                            prefix: AppIcons.orgNameame,

                          ),
                          const TextWidget("brand_english"),
                          TextFieldWidget(
                            // errorText: logic.stepOneModel?.data==null?logic.stepOneModel?.data?.englishName!.first:"",
                            validator: (value) =>
                                InputValidations.validateName(value),
                            controller: logic.brandEnglish,
                            hintText: 'شركة الدرعية القابضة  ',
                            prefix: AppIcons.orgNameame,
                          ),
                          const TextWidget("org_phone"),
                          PhoneFieldWidget(
                            controller: logic.phone,
                          ),
                          const TextWidget("email"),
                          TextFieldWidget(
                            // errorText: logic.stepOneModel?.data==null?logic.stepOneModel?.data?.businessEmail!.first:"",
                            validator: (value) =>
                                InputValidations.validateName(value),
                            controller: logic.emailFirst,
                            hintText: 'البريد الالكتروني للمشروع',
                            prefix: AppIcons.email,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.bottomSheet(
                                  StatefulBuilder(
                                    builder: (context,state) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height - 70.h,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12))),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.h, horizontal: 12.w),
                                              height: 40.h,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  topRight: Radius.circular(12),
                                                ),
                                                color: AppColors.primary,
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.clear,
                                                    color: Colors.white,
                                                    size: 25.w,
                                                  ),
                                                  Expanded(
                                                    child: defaultFormField(
                                                        controller: null,
                                                        type: TextInputType.text,
                                                        fillColor: Colors.white,
                                                        prefix: Icon(
                                                          Icons.search,
                                                          color: Colors.grey,
                                                          size: 20.w,
                                                        ),
                                                        hintText: "البحث في الفئة",
                                                        hintStyle:
                                                            TextStyle(fontSize: 14.sp),
                                                        writeFontSize: 14.sp,
                                                        textAlignVertical:
                                                            TextAlignVertical.center),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Flexible(
                                              child: ListView.separated(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 16.w, vertical: 10.h),
                                                  itemBuilder: (c, i) {
                                                    return InkWell(
                                                        onTap: () {
                                                          logic.chooseValue(
                                                              logic
                                                                  .categoriesModel!
                                                                  .data![i]
                                                                  .name!,
                                                              logic
                                                                  .categoriesModel!
                                                                  .data![i]
                                                                  .id!);
                                                          logic.update();
                                                          Get.back();
                                                        setState(() {
                                                        });
                                                        },
                                                        child: Text(logic
                                                            .categoriesModel!
                                                            .data![i]
                                                            .name!));
                                                  },
                                                  separatorBuilder: (c, i) {
                                                    return Divider();
                                                  },
                                                  itemCount: logic
                                                      .categoriesModel!.data!.length),
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                  ),
                                  isScrollControlled: true);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32.w, vertical: 10.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("التصنيف"),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(logic.varietiesSelect??""),
                                      Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        size: 18.w,
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color:logic.varietiesSelect!=null?Colors.grey.shade300: Colors.red,
                                    thickness: .7,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 200.h,
                          )
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextWidget("org_name"),
                          TextFieldWidget(
                            validator: (value) =>
                                InputValidations.validateName(value),
                            controller: logic.orgName,
                            hintText: 'شركة الدرعية القابضة  ',
                            prefix: AppIcons.orgNameame,
                          ),
                          const TextWidget("brand_arabic"),
                          TextFieldWidget(
                            validator: (value) =>
                                InputValidations.validateName(value),
                            controller: logic.brandArabic,
                            hintText: 'شركة الدرعية القابضة  ',
                            prefix: AppIcons.orgNameame,
                          ),
                          const TextWidget("brand_english"),
                          TextFieldWidget(
                            validator: (value) =>
                                InputValidations.validateName(value),
                            controller: logic.brandEnglish,
                            hintText: 'شركة الدرعية القابضة  ',
                            prefix: AppIcons.orgNameame,
                          ),
                          const TextWidget("org_phone"),
                          PhoneFieldWidget(
                            controller: logic.phone,
                          ),
                          const TextWidget("email"),
                          TextFieldWidget(
                            // errorText: logic.stepOneModel?.data==null?logic.stepOneModel?.data?.businessEmail!.first:"",
                            validator: (value) =>
                                InputValidations.validateName(value),
                            controller: logic.emailFirst,
                            hintText: 'البريد الالكتروني للمشروع',
                            prefix: AppIcons.email,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.bottomSheet(
                                  StatefulBuilder(
                                      builder: (context,state) {
                                        return Container(
                                          height:
                                          MediaQuery.of(context).size.height - 70.h,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  topRight: Radius.circular(12))),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 12.h, horizontal: 12.w),
                                                height: 40.h,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(12),
                                                    topRight: Radius.circular(12),
                                                  ),
                                                  color: AppColors.primary,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.clear,
                                                      color: Colors.white,
                                                      size: 25.w,
                                                    ),
                                                    Expanded(
                                                      child: defaultFormField(
                                                          controller: null,
                                                          type: TextInputType.text,
                                                          fillColor: Colors.white,
                                                          prefix: Icon(
                                                            Icons.search,
                                                            color: Colors.grey,
                                                            size: 20.w,
                                                          ),
                                                          hintText: "البحث في الفئة",
                                                          hintStyle:
                                                          TextStyle(fontSize: 14.sp),
                                                          writeFontSize: 14.sp,
                                                          textAlignVertical:
                                                          TextAlignVertical.center),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.h,
                                              ),
                                              Flexible(
                                                child: ListView.separated(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 16.w, vertical: 10.h),
                                                    itemBuilder: (c, i) {
                                                      return InkWell(
                                                          onTap: () {
                                                            logic.chooseValue(
                                                                logic
                                                                    .categoriesModel!
                                                                    .data![i]
                                                                    .name!,
                                                                logic
                                                                    .categoriesModel!
                                                                    .data![i]
                                                                    .id!);
                                                            logic.update();
                                                            Get.back();
                                                            setState(() {
                                                            });
                                                          },
                                                          child: Text(logic
                                                              .categoriesModel!
                                                              .data![i]
                                                              .name!));
                                                    },
                                                    separatorBuilder: (c, i) {
                                                      return Divider();
                                                    },
                                                    itemCount: logic
                                                        .categoriesModel!.data!.length),
                                              )
                                            ],
                                          ),
                                        );
                                      }
                                  ),
                                  isScrollControlled: true);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32.w, vertical: 10.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("التصنيف"),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(logic.varietiesSelect??""),
                                      Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        size: 18.w,
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color:logic.varietiesSelect!=null?Colors.grey.shade300: Colors.red,
                                    thickness: .7,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 170.h,
                          )
                        ],
                      ),
              ],
            ),
          ),
        );
      }
    );
  }
}
