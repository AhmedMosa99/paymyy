import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/theme/app_text_styles.dart';
import 'package:paymyy/core/values/assets/app_icons.dart';

class PhoneFieldWidget extends StatefulWidget {
  TextEditingController controller;
  double horizontal;

  PhoneFieldWidget({required this.controller,this.horizontal=35});

  @override
  State<PhoneFieldWidget> createState() => _PhoneFieldWidgetState();
}

class _PhoneFieldWidgetState extends State<PhoneFieldWidget> {
  List<String> phones = ['+965', '+972', '+970', '+08'];
  String value = '+965';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.horizontal.w, vertical: 11.h),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.greyf8,
            enabledBorder: buildOutlineInputBorder(),
            border: buildOutlineInputBorder(),
            errorBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            prefixIcon: Container(
              width: 80.w,
              height: 52.h,
              decoration: BoxDecoration(
                  color: AppColors.graye2,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  SvgPicture.asset(
                    AppIcons.call,
                    fit: BoxFit.scaleDown,
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  buildDropDownButton(),
                ],
              ),
            )),
      ),
    );
  }

  DropdownButton2<String> buildDropDownButton() {
    return DropdownButton2(
                  dropdownWidth: 80.w,
                  underline: SizedBox(),
                  value: value,
                  onChanged: (val) {
                    value = val!;
                    setState(() {});
                  },
                  items: phones
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Container(
                              margin: EdgeInsetsDirectional.only(end: 10),
                              child: Text(
                                e,
                                style: AppTextStyles.b10,
                              ))))
                      .toList(),
                  icon: SvgPicture.asset(AppIcons.dropdown),
                );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.greyf8, width: 1),
    );
  }
}
