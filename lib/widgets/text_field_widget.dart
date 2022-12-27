import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/theme/app_text_styles.dart';

class TextFieldWidget extends StatefulWidget {
  String hintText;
  TextEditingController controller;
  String prefix;
  String suffix;
  bool obscure;
  bool isPassord;
  TextInputType type;
  FormFieldValidator validator;
  TextFieldWidget(
      {this.isPassord=false,
        required this.validator,
        this.obscure=false,
      this.type = TextInputType.text,
      this.prefix = '',
      this.suffix = '',
      required this.controller,
      required this.hintText});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 35.w, vertical: 11.h),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.isPassord?widget.obscure:false,
        keyboardType: widget.type,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.greyf8,
          enabledBorder: buildOutlineInputBorder(),
          border: buildOutlineInputBorder(),
          errorBorder: buildOutlineInputBorder(),
          focusedErrorBorder:buildOutlineInputBorder() ,
          focusedBorder: buildOutlineInputBorder(),
          labelText: widget.hintText,
          labelStyle: widget.obscure?AppTextStyles.r20.copyWith(color: AppColors.greyb4):AppTextStyles.r12,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: widget.prefix.length == 0
              ? SizedBox()
              : widget.prefix.contains('svg')
                  ? SvgPicture.asset(
                      widget.prefix,
                      fit: BoxFit.scaleDown,
                    )
                  : Image.asset(
                      widget.prefix,
                      fit: BoxFit.scaleDown,
                    ),
          suffixIcon: widget.prefix.length == 0
              ? SizedBox()
              : GestureDetector(
            onTap: (){

              widget.obscure=!widget.obscure;
              setState(() {
              });

            },
                child: SvgPicture.asset(
                    widget.suffix,
                    fit: BoxFit.scaleDown,
                  ),
              ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.greyf8, width: 1),
        );
  }
}
