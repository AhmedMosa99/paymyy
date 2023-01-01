import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/theme/input_validations.dart';
import 'package:paymyy/core/values/assets/app_icons.dart';
import 'package:paymyy/core/values/assets/app_images.dart';
import 'package:paymyy/widgets/button_widget.dart';
import 'package:paymyy/widgets/text_field_widget.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../widgets/custom_tile_info_widget.dart';

class DisplayBillPage extends StatelessWidget {
  DisplayBillPage({Key? key}) : super(key: key);
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "bill_details".tr,
          style: AppTextStyles.b20.copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsetsDirectional.only(start: 15.w),
              child: buildMainInfo()),
          SizedBox(
            height: 30.h,
          ),
          buildBill(),
          SizedBox(
            height: 16.h,
          ),
          emptyCard(
              height: 234.h,
              body: Column(
                children: [
                  CustomTileInfoWidget(title: "client_name", val: 'سارة'),
                  CustomTileInfoWidget(title: "bill_no", val: '876557'),
                  CustomTileInfoWidget(title: "client_mobile", val: '00000000'),
                  CustomTileInfoWidget(
                      title: "bill_reference", val: '334696866655'),
                  CustomTileInfoWidget(title: "email", val: '-'),
                  CustomTileInfoWidget(title: "date_created", val: '1\1\2022'),
                ],
              )),
          Container(
              margin: EdgeInsetsDirectional.only(
                  start: 17.w, top: 30.h, bottom: 16.h),
              child: Text(
                "how_pay".tr,
                style: AppTextStyles.b12.copyWith(color: AppColors.black22),
              )),
          buildKeynet(),
          buildpayField(),
          Center(child: ButtonWidget(title: "pay_now".tr, function: () {})),
          SizedBox(
            height: 35.h,
          ),
        ],
      )),
    );
  }

  Container buildpayField() {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 16.h, bottom: 30.h),
      child: emptyCard(
          padding: 0,
          height: 135.h,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 17.w),
                child: Text(
                  "card_owener_name".tr,
                  style: AppTextStyles.b12.copyWith(color: AppColors.grey87),
                ),
              ),
              Divider(
                color: AppColors.grey87,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 17.w),
                    child: Text(
                      "card_no".tr,
                      style:
                          AppTextStyles.b12.copyWith(color: AppColors.grey87),
                    ),
                  ),
                  Spacer(),
                  Image.asset(AppImages.visa),
                  SizedBox(
                    width: 10.w,
                  ),
                  Image.asset(AppImages.master),
                  SizedBox(
                    width: 17.w,
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Divider(color: AppColors.grey87, height: 0),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFieldWidget(
                        type: TextInputType.number,
                          decoration:false,
                        horozontal: 0,
                        vertical: 0,
                          validator: (value) =>
                              InputValidations.validateName(value),
                          controller: c1,
                          hintText: 'YY/MM'),
                    ),
                    Container(
                        height: 50.h,
                        child: VerticalDivider(
                          color: AppColors.grey87,
                        )),
                    Expanded(
                      child: TextFieldWidget(
                          type: TextInputType.number,
                        decoration:false,
                        horozontal: 0,
                        vertical: 0,
                          validator: (value) =>
                              InputValidations.validateName(value),
                          controller: c2,
                          hintText: 'CVV'),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget buildKeynet() {
    return emptyCard(
        height: 40,
        body: ListTile(
          horizontalTitleGap: 0.w,
          title: Text(
            'كي نت',
            style: AppTextStyles.b12.copyWith(color: AppColors.primary),
          ),
          trailing: Text(
            '23.000 د.ك ',
            style: AppTextStyles.b12.copyWith(color: AppColors.primary),
          ),
          leading: Image.asset(
            AppImages.keynet,
            width: 28.w,
            height: 18.h,
          ),
        ));
  }

  Widget buildBill() {
    return emptyCard(
        height: 72,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "pill_value".tr,
                style: AppTextStyles.b14.copyWith(color: AppColors.black22),
              ),
              Text("23.000 د.ك",
                  style: AppTextStyles.b16.copyWith(color: AppColors.primary)),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("تنتهي خلال 1 يوم واحد",
                  style: AppTextStyles.b14.copyWith(color: AppColors.grey78)),
            ])
          ],
        ));
  }

  Widget emptyCard(
      {required double height, required Widget body, double padding = 25}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(width: 0.7, color: AppColors.whitef3)),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: padding.w),
        height: height.h,
        child: body,
      ),
    );
  }

  Widget buildMainInfo() {
    return Container(
      width: 343.w,
      height: 167.h,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            width: 104.w,
            height: 90.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                Icons.image_outlined,
                size: 50,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              buildCustomDetails(
                  icon: AppIcons.orgNameame, title: "شركة الدرعية القابضة"),
              buildCustomDetails(
                  icon: AppIcons.email, title: "sara@hotmail.com  "),
              buildCustomDetails(
                  icon: AppIcons.emailLink, title: "رابط الموقع الالكتروني"),
              buildCustomDetails(icon: AppIcons.call, title: "  0000000"),
            ],
          )
        ],
      ),
    );
  }

  Widget buildCustomDetails({required String icon, required String title}) =>
      Container(
        margin: EdgeInsetsDirectional.only(bottom: 10.h),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              title,
              style: AppTextStyles.b12.copyWith(color: Colors.white),
            ),
          ],
        ),
      );
}
