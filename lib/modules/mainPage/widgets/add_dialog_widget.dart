import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/theme/app_text_styles.dart';
import 'package:paymyy/core/theme/input_validations.dart';
import 'package:paymyy/widgets/button_widget.dart';
import 'package:paymyy/widgets/text_field_widget.dart';

class AddDialogWidget extends StatefulWidget {

  AddDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddDialogWidget> createState() => _AddDialogWidgetState();
}

class _AddDialogWidgetState extends State<AddDialogWidget> {
  TextEditingController name = TextEditingController();

  TextEditingController price = TextEditingController();

  TextEditingController number = TextEditingController();
  List<String> items = ['د.ك', 'EURO', 'US'];

  String selected = 'د.ك';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Text(
              "add_product".tr,
              style: AppTextStyles.r14.copyWith(color: Colors.black),
            ),
            Container(
                width: 280.w,
                child: TextFieldWidget(
                    fillColor: Colors.white,
                    borderColor: Colors.grey.shade300,
                    horozontal: 0,
                    validator: (value) => InputValidations.validateName(value),
                    controller: name,
                    hintText: "product_name".tr)),
            Container(
                child: TextFieldWidget(
                  suffexWidget: Container(
                    width: 60.w,
                    height: 55.h,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(10),bottomEnd: Radius.circular(5)),
                     color: AppColors.grey87.withOpacity(0.4),
                   ),
                    child:  DropdownButton2(
                        icon: SizedBox(),
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
                              style: AppTextStyles.b10.copyWith(color: Colors.white),
                            )))
                            .toList()),
                  ),
                    fillColor: Colors.white,
                    borderColor: Colors.grey.shade300,
                    horozontal: 0,
                    validator: (value) => InputValidations.validateName(value),
                    controller: price,
                    type: TextInputType.number,
                    hintText: "price".tr)),
            Container(
                width: 280.w,
                child: TextFieldWidget(
                    fillColor: Colors.white,
                    borderColor: Colors.grey.shade300,
                    horozontal: 0,
                    validator: (value) => InputValidations.validateName(value),
                    controller: number,
                    type: TextInputType.number,
                    hintText: "number".tr)),
            Container(
                width: 280.w,
                margin: EdgeInsetsDirectional.only(
                  top: 35.h,
                  bottom: 20.h,
                ),
                child: ButtonWidget(
                  title: 'add'.tr,
                  function: () {},
                  horozontal: 0,
                ))
          ],
        ),
      ),
    );
  }
}
