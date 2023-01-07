import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/theme/input_validations.dart';
import 'package:paymyy/modules/mainPage/pages/Tabs/addTab/product_creation_controller.dart';
import 'package:paymyy/widgets/button_widget.dart';
import 'package:paymyy/widgets/text_field_widget.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/values/assets/app_images.dart';

class ProductcreationPage extends StatefulWidget {
  const ProductcreationPage({Key? key}) : super(key: key);

  @override
  State<ProductcreationPage> createState() => _ProductcreationPageState();
}

class _ProductcreationPageState extends State<ProductcreationPage> {
  TextEditingController category = TextEditingController();
  TextEditingController arabicName = TextEditingController();
  TextEditingController englishName = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController descArabic = TextEditingController();
  TextEditingController descEnglish = TextEditingController();
  List<String> items = ['د.ك', 'EURO', 'US'];

  String selected = 'د.ك';
  bool switchVal = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          "product_creation".tr,
          style: AppTextStyles.b20.copyWith(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GetBuilder<ProductCreationController>(
        init: ProductCreationController(),
        builder: (logic) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 160.h,
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: logic.updatedFile == null
                          ? const DecorationImage(
                              image: AssetImage(AppImages.productTest),
                              fit: BoxFit.fill)
                          : DecorationImage(
                              image: FileImage(logic.updatedFile!),
                              fit: BoxFit.fill),
                    ),
                  ),
                  PositionedDirectional(
                    bottom: 25.h,
                    start: 25.w,
                    child: GestureDetector(
                      onTap: () {
                        logic.selectProductImage();
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Center(
                          child: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsetsDirectional.only(start: 16.w, bottom: 10.h),
                  child: Text(
                    "product_info".tr,
                    style: AppTextStyles.r16.copyWith(color: Colors.black),
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                height: 470.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.grey87, width: 0.5),
                    boxShadow:const [
                       BoxShadow(
                        offset: Offset(0, 2),
                        spreadRadius: 2,
                        color: Color.fromARGB(1, 0, 0, 0),
                      )
                    ]),
                child: buildMainInformation(),
              )
            ],
          );
        },
      ),
    );
  }

  ListView buildMainInformation() {
    return ListView(
      shrinkWrap: true,
      children: [
        TextFieldWidget(
            horozontal: 16,
            borderColor: Colors.grey.shade300,
            hintText: "category".tr,
            validator: (val) => InputValidations.validateName(val),
            controller: category),
        TextFieldWidget(
            horozontal: 16,
            borderColor: Colors.grey.shade300,
            hintText: "arabic_product".tr,
            validator: (val) => InputValidations.validateName(val),
            controller: arabicName),
        TextFieldWidget(
            horozontal: 16,
            borderColor: Colors.grey.shade300,
            hintText: "english_product".tr,
            validator: (val) => InputValidations.validateName(val),
            controller: englishName),
        TextFieldWidget(
          horozontal: 16,
          borderColor: Colors.grey.shade300,
          hintText: "amount".tr,
          validator: (val) => InputValidations.validateName(val),
          controller: amount,
          type: TextInputType.number,
        ),
        TextFieldWidget(
          horozontal: 16,
          borderColor: Colors.grey.shade300,
          suffexWidget: Container(
            width: 60.w,
            height: 55.h,
            decoration: BoxDecoration(
              borderRadius: const BorderRadiusDirectional.only(
                  topEnd: Radius.circular(10), bottomEnd: Radius.circular(5)),
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
                          style:
                              AppTextStyles.b10.copyWith(color: Colors.black),
                        )))
                    .toList()),
          ),
          hintText: "price".tr,
          validator: (val) => InputValidations.validateName(val),
          controller: price,
          type: TextInputType.number,
        ),
        TextFieldWidget(
            horozontal: 16,
            borderColor: Colors.grey.shade300,
            hintText: "english_desc".tr,
            validator: (val) => InputValidations.validateName(val),
            controller: descEnglish),
        TextFieldWidget(
            horozontal: 16,
            borderColor: Colors.grey.shade300,
            hintText: "arabic_desc".tr,
            validator: (val) => InputValidations.validateName(val),
            controller: descArabic),
        ListTile(
          leading: Text("active".tr,
              style: AppTextStyles.r16.copyWith(color: Colors.black)),
          trailing: Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: AppColors.primary,
              value: switchVal,
              onChanged: (val) {
                setState(() {
                  switchVal = val;
                });
              },
            ),
          ),
        ),
        ButtonWidget(
          title: 'next'.tr,
          function: () {},
          horozontal: 26,
        ),
        SizedBox(
          height: 200.h,
        )
      ],
    );
  }
}
