import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:paymyy/core/theme/app_text_styles.dart';
import 'package:paymyy/core/values/assets/app_icons.dart';
import 'package:get/get.dart';

import '../../../data/models/flag_model.dart';

class DropDownWidget extends StatefulWidget {
  DropDownWidget({Key? key}) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String flag = "kwait";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 33.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: AppColors.greyba, width: 0.2),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(186, 186, 186, 0.25),
                offset: Offset(0, 0),
                blurRadius: 2,
                spreadRadius: 2)
          ]),
      child: DropdownButton2(
        isExpanded: true,
        dropdownDirection: DropdownDirection.right,
        value: flag,
        items: flags
            .map((e) => DropdownMenuItem(
                value: e.name,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      e.flag,
                      width: 24.w,
                      height: 16.h,
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    Text(
                      e.name.tr,
                      style: e.name.tr.length>7?AppTextStyles.b8:AppTextStyles.b12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )))
            .toList(),
        icon: Container(
            margin: EdgeInsetsDirectional.only(end: 14.w),
            child: SvgPicture.asset(AppIcons.dropdown)),
        onChanged: (v) {
          flag = v!;
          setState(() {});
        },
        underline: const SizedBox(),
      ),
    );
  }
}
