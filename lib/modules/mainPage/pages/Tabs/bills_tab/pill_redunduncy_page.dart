import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paymyy/core/theme/input_validations.dart';
import 'package:paymyy/core/values/assets/app_icons.dart';
import 'package:paymyy/widgets/button_widget.dart';
import 'package:paymyy/widgets/text_field_widget.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/values/assets/app_images.dart';
import '../../../widgets/add_dialog_widget.dart';
import '../../../widgets/custom_tab_widget.dart';

class PillRedunduncyPage extends StatefulWidget {
  PillRedunduncyPage({Key? key}) : super(key: key);

  @override
  State<PillRedunduncyPage> createState() => _PillRedunduncyPageState();
}

class _PillRedunduncyPageState extends State<PillRedunduncyPage> {
  bool check = false;
  bool tab1 = true, tab2 = false, tab3 = false, tab4 = false;
  TextEditingController name = TextEditingController();
  TextEditingController gmail = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController clientReference = TextEditingController();
  TextEditingController notes = TextEditingController();
  bool isVisible = false;
  List<String> items = ['د.ك', 'EURO', 'US'];
  int percentage = 0;
  int lang = 0;
  String selected = 'د.ك';
  String fileSelected = '';

  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          "bill_create".tr,
          style: AppTextStyles.b20.copyWith(color: Colors.black),
        ),
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            buildContainerCondition(),
            SizedBox(
              height: 16.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              height: isVisible ? 600.h : 550.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primary.withOpacity(0.8),
              ),
              child: mainListDetails(),
            )
          ],
        ),
      ),
    );
  }

  ListView mainListDetails() {
    return ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 35.h,
                ),
                Center(
                  child: Text('00.00',
                      style: AppTextStyles.b24.copyWith(color: Colors.white)),
                ),
                buildDropdownButton(),
                TextFieldWidget(
                  horozontal: 26,
                  validator: (value) => InputValidations.validateName(value),
                  suffix: AppIcons.add,
                  controller: name,
                  hintText: 'سارة محمد الخالد',
                  prefix: AppImages.name,
                ),
                TextFieldWidget(
                  horozontal: 26,
                  validator: (value) => InputValidations.validateName(value),
                  controller: gmail,
                  hintText: 'sara@hotmail.com  ',
                  prefix: AppIcons.email,
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 26.w,bottom: 10.h),
                  child: Text(
                    'تاريخ الانتهاء',
                    style: AppTextStyles.r12.copyWith(color: Colors.white),
                  ),
                ),
                buildDate(),
                Container(
                  height: 50.h,
                  margin: EdgeInsets.symmetric(horizontal: 26.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: ListTile(
                    horizontalTitleGap: 0,
                    onTap: () {
                      selectFile();
                    },
                    leading: SvgPicture.asset(AppIcons.file),
                    title: Text(
                      fileSelected.isEmpty ? ' أرفق ملف' : fileSelected,
                      style: AppTextStyles.r10.copyWith(
                          color: fileSelected.isEmpty
                              ? AppColors.grey87
                              : Colors.black),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  contentPadding: EdgeInsetsDirectional.only(start: 30.w),
                  horizontalTitleGap: 0,
                  leading: SvgPicture.asset(AppIcons.advance),
                  title: Text(
                    "advance".tr,
                    style: isVisible
                        ? AppTextStyles.ul14.copyWith(color: Colors.white)
                        : AppTextStyles.r14.copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                buildVisibility(),
                ButtonWidget(
                    textcolor: AppColors.secondary,
                    horozontal: 26,
                    bgColor: Colors.white,
                    title: "bill_create".tr,
                    function: () {
                      Get.dialog(AddDialogWidget(),);
                    })
              ],
            );
  }

  Visibility buildVisibility() {
    return Visibility(
      visible: isVisible,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 26.w),
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.greyf8, width: 1),
              color: AppColors.greyf8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10.w,
                      height: 10.h,
                      margin: EdgeInsetsDirectional.only(start: 16.w, end: 8.w),
                      child: Radio(
                        activeColor: AppColors.primary,
                        groupValue: percentage,
                        value: 0,
                        onChanged: (x) {
                          setState(() {
                            percentage = x!;
                          });
                        },
                      ),
                    ),
                    Text(
                      "fixed".tr,
                      style: AppTextStyles.r12,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 10.w,
                      height: 10.h,
                      margin: EdgeInsetsDirectional.only(end: 8.w, start: 16.w),
                      child: Radio(

                        activeColor: AppColors.primary,
                        groupValue: percentage,
                        value: 1,
                        onChanged: (x) {
                          setState(() {
                            percentage = x!;
                          });
                        },
                      ),
                    ),
                    Text(
                      "percentage".tr + ' %',
                      style: AppTextStyles.r12,
                    ),
                  ],
                ),
                VerticalDivider(
                  color: AppColors.grey87,
                ),
                Text('0.0', style: AppTextStyles.r10),
                VerticalDivider(
                  color: AppColors.grey87,
                ),
                Text('%', style: AppTextStyles.r10),
              ],
            ),
          ),
          TextFieldWidget(
              horozontal: 26,
              validator: (value) => InputValidations.validateName(value),
              controller: clientReference,
              prefix: AppIcons.clientReference,
              hintText: "client_reference".tr),
          TextFieldWidget(
            blackLabel: true,
              maxLines: 4,
              horozontal: 26,
              validator: (value) => InputValidations.validateName(value),
              controller: notes,
              hintText: "notes".tr),
          ListTile(
            contentPadding: EdgeInsetsDirectional.only(start: 36.w),
            horizontalTitleGap: 0,
            leading: SvgPicture.asset(AppIcons.lang),
            title: Text(
              "lang".tr,
              style: AppTextStyles.ul14.copyWith(color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(
                start: 26.w, end: 26.w, bottom: 16.h),
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.greyf8, width: 1),
              color: AppColors.greyf8,
            ),
            child: Row(
              children: [
                Container(
                  width: 10.w,
                  height: 10.h,
                  margin: EdgeInsetsDirectional.only(start: 16.w, end: 8.w),
                  child: Radio(
                    activeColor: AppColors.primary,
                    groupValue: lang,
                    value: 1,
                    onChanged: (x) {
                      setState(() {
                        lang = x!;
                      });
                    },
                  ),
                ),
                Text(
                  "english".tr,
                  style: AppTextStyles.r12,
                ),
                Container(
                  width: 10.w,
                  height: 10.h,
                  margin: EdgeInsetsDirectional.only(end: 8.w, start: 16.w),
                  child: Radio(
                    activeColor: AppColors.primary,
                    groupValue: lang,
                    value: 2,
                    onChanged: (x) {
                      setState(() {
                        lang = x!;
                      });
                    },
                  ),
                ),
                Text(
                  "arabic".tr,
                  style: AppTextStyles.r12,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 26.w),
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.greyf8, width: 1),
              color: AppColors.greyf8,
            ),
            child: Row(
              children: [
                SizedBox(width: 16.w,),
                Text('products'.tr, style: AppTextStyles.r12),
                Spacer(),
                SvgPicture.asset(AppIcons.product),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  child: SvgPicture.asset(AppIcons.add),
                )
              ],
            ),
          ),
          Row(
         children:[ GestureDetector(
           onTap: (){
             setState(() {
               check=!check;
             });
           },
           child: Container(
             margin: EdgeInsetsDirectional.only(end: 10.w,start: 30.w,top: 16.h,bottom: 16.h),
             width: 17.w,
             height: 17.h,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(4),
               color: Colors.white
             ),
             child: Visibility(
               visible: check,
               child:Center(child:  Icon(Icons.check,color: AppColors.primary,size: 17,),),
             ),
           ),
         ),
             Text(
              "terms_condtions".tr,
              style: AppTextStyles.r8.copyWith(color: AppColors.black1e),
            ),]
          )
        ],
      ),
    );
  }

  Center buildDropdownButton() {
    return Center(
      child: DropdownButton2(
          icon: SvgPicture.asset(
            AppIcons.dropdown,
            color: Colors.white,
          ),
          underline: SizedBox(),
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
                    style: AppTextStyles.b14.copyWith(color: AppColors.greyf8),
                  )))
              .toList()),
    );
  }

  selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path ?? '');
      fileSelected = file.path.substring(48);
      setState(() {});
    } else {
      Get.snackbar('Warning', 'Please select file');
    }
  }

  Container buildContainerCondition() {
    return Container(
      height: 40.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.grey87, width: 0.3),
        color: AppColors.greyf8,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  tab1 = true;
                  tab2 = false;
                  tab3 = false;
                  tab4 = false;
                });
              },
              child: CustomTabWidget(
                isSelected: tab1,
                name: "sms_massage",
                isBill: true,
              )),
          GestureDetector(
              onTap: () {
                setState(() {
                  tab1 = false;
                  tab3 = false;
                  tab4 = false;
                  tab2 = true;
                });
              },
              child: CustomTabWidget(
                isSelected: tab2,
                name: "watsapp",
                isBill: true,
              )),
          GestureDetector(
              onTap: () {
                setState(() {
                  tab1 = false;
                  tab2 = false;
                  tab3 = true;
                  tab4 = false;
                });
              },
              child: CustomTabWidget(
                isSelected: tab3,
                name: "alemail",
                isBill: true,
              )),
          GestureDetector(
              onTap: () {
                setState(() {
                  tab1 = false;
                  tab2 = false;
                  tab3 = false;
                  tab4 = true;
                });
              },
              child: CustomTabWidget(
                isSelected: tab4,
                name: "link",
                isBill: true,
              )),
        ],
      ),
    );
  }

  Widget buildDate() {
    return Container(
        height: 50.h,
        margin: EdgeInsets.symmetric(horizontal: 26.w, vertical: 11.h),
        child: Center(
            child: TextField(
          controller: dateinput,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.greyf8,
            enabledBorder: buildOutlineInputBorder(),
            border: buildOutlineInputBorder(),
            labelText: "1\12\2022",
            labelStyle: AppTextStyles.r12.copyWith(color: AppColors.greyb4),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: Image.asset(
              AppImages.date,
              fit: BoxFit.scaleDown,
            ),
          ),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2101));
            if (pickedDate != null) {
              print(
                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate =
                  DateFormat('yyyy/MM/dd').format(pickedDate);
              print(
                  formattedDate); //formatted date output using intl package =>  2021-03-16
              //you can implement different kind of Date Format here according to your requirement

              setState(() {
                dateinput.text =
                    formattedDate; //set output date to TextField value.
              });
            } else {
              print("Date is not selected");
            }
          },
        )));
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.greyf8, width: 1),
    );
  }
}
