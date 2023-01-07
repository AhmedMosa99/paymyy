import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_colors.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/input_validations.dart';
import '../../../../core/values/assets/app_icons.dart';
import '../../../../widgets/button_widget.dart';
import '../../../../widgets/text_field_widget.dart';
import '../../widgets/sort_sheet_widget.dart';

class BillLinkCreatePage extends StatefulWidget {
  BillLinkCreatePage({Key? key}) : super(key: key);

  @override
  State<BillLinkCreatePage> createState() => _BillLinkCreatePageState();
}

class _BillLinkCreatePageState extends State<BillLinkCreatePage> {
  int groupVal = 1;
  List<String> items = ['د.ك', 'EURO', 'US'];

  String selected = 'د.ك';
  TextEditingController address = TextEditingController();

  TextEditingController value = TextEditingController();

  TextEditingController minmum = TextEditingController();

  TextEditingController maxmum = TextEditingController();

  TextEditingController notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "payment_links".tr,
          style: AppTextStyles.b20.copyWith(color: Colors.black),
        ),
        toolbarHeight: 75.h,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
              onTap: () {}, child: SvgPicture.asset(AppIcons.search)),
          SizedBox(
            width: 16.w,
          ),
          GestureDetector(
              onTap: () {
                Get.bottomSheet(
                  const SortSheetWidget(),
                  ignoreSafeArea: true,
                  barrierColor: Colors.black26,
                  isScrollControlled: true,
                  enableDrag: false,
                  isDismissible: false,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(25),
                      topStart: Radius.circular(25),
                    ),
                  ),
                );
              },
              child: SvgPicture.asset(AppIcons.filter)),
          SizedBox(
            width: 16.w,
          ),
        ],
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
              margin: EdgeInsetsDirectional.only(start: 16.w),
              child: Text(
                "payments_link_details".tr,
                style: AppTextStyles.b14.copyWith(color: AppColors.primary),
              )),
          Divider(
            color: AppColors.grey87,
          ),
          buildFirstInfo(),
          Container(
              margin: EdgeInsetsDirectional.only(
                  start: 16.w, top: 30.h, bottom: 10.h),
              child: Text(
                "value_details".tr,
                style: AppTextStyles.b14.copyWith(color: AppColors.primary),
              )),
          Divider(
            color: AppColors.grey87,
          ),
          buildSecondInfo(),
          SizedBox(
            height: 15.h,
          ),
          ButtonWidget(function: () {}, title: "link_create".tr),
        ],
      ),
    );
  }

  Card buildFirstInfo() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: AppColors.whitef3, width: 0.7)),
      child: Container(
        height: 270.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWidget(
                horozontal: 16,
                controller: address,
                hintText: "link_address".tr,
                validator: (value) => InputValidations.validateName(value)),
            TextFieldWidget(
                prefexWidget: Container(
                  width: 60.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(10),
                        bottomStart: Radius.circular(5)),
                    color: AppColors.grey87.withOpacity(0.4),
                  ),
                  child: DropdownButton2(
                      icon: const SizedBox(),
                      underline: const SizedBox(),
                      value: selected,
                      onChanged: (x) {
                        setState(() {
                          selected = x!;
                        });
                      },
                      items: items
                          .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: AppTextStyles.b10
                                    .copyWith(color: Colors.black),
                              )))
                          .toList()),
                ),
                suffix: AppIcons.dropdown,
                horozontal: 16,
                controller: value,
                type: TextInputType.number,
                hintText: "  " + "pill_value".tr,
                validator: (value) => InputValidations.validateName(value)),
            Row(
              children: [
                Container(
                    margin: EdgeInsetsDirectional.only(start: 16, end: 10.w),
                    child: SvgPicture.asset(AppIcons.lang)),
                Text(
                  'lang'.tr,
                  style: AppTextStyles.ul14,
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              height: 60.h,
              decoration: BoxDecoration(
                  color: AppColors.greyf8,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Radio(
                    activeColor: AppColors.primary,
                    groupValue: groupVal,
                    value: 1,
                    onChanged: (x) {
                      groupVal = x!;
                      setState(() {});
                    },
                  ),
                  Text("english".tr),
                  Radio(
                    activeColor: AppColors.primary,
                    groupValue: groupVal,
                    value: 2,
                    onChanged: (x) {
                      groupVal = x!;
                      setState(() {});
                    },
                  ),
                  Text("arabic".tr)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card buildSecondInfo() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: AppColors.whitef3, width: 0.7)),
      child: Container(
        height: 300.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWidget(
                horozontal: 16,
                controller: minmum,
                type: TextInputType.number,
                hintText: "min".tr,
                validator: (value) => InputValidations.validateName(value)),
            TextFieldWidget(
                type: TextInputType.number,
                horozontal: 16,
                controller: maxmum,
                hintText: "max".tr,
                validator: (value) => InputValidations.validateName(value)),
            Container(
                padding: EdgeInsetsDirectional.only(start: 16.w),
                child: Text(
                  "notes".tr,
                  style: AppTextStyles.ul14,
                )),
            TextFieldWidget(
                horozontal: 16,
                controller: notes,
                hintText: '',
                maxLines: 3,
                validator: (value) => InputValidations.validateName(value)),
          ],
        ),
      ),
    );
  }
}
