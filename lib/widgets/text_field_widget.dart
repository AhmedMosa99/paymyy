import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/theme/app_text_styles.dart';

class TextFieldWidget extends StatefulWidget {
  String hintText;
  TextEditingController? controller;
  String prefix;
  Color fillColor, borderColor;
  bool blackLabel;
  int maxLines;
  String suffix;
  bool obscure;
  bool isPassord;
  bool decoration;
  double vertical, horozontal;
  TextInputType type;
  FormFieldValidator validator;
  Widget? suffexWidget, prefexWidget;
  String? errorText;

  TextFieldWidget(
      {this.isPassord = false,
      this.suffexWidget,
      this.errorText,
      this.prefexWidget,
      this.borderColor = const Color(0xffF8F8F8),
      this.vertical = 11,
      this.maxLines = 1,
      this.blackLabel = false,
      this.fillColor = const Color(0xffF8F8F8),
      this.horozontal = 35,
      this.decoration = true,
      required this.validator,
      this.obscure = false,
      this.type = TextInputType.text,
      this.prefix = '',
      this.suffix = '',
      this.controller,
      required this.hintText});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: widget.horozontal.w, vertical: widget.vertical.h),
      child: TextFormField(
        maxLines: widget.maxLines,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.isPassord ? widget.obscure : false,
        keyboardType: widget.type,
        decoration: widget.decoration
            ? InputDecoration(
                alignLabelWithHint: true,
                filled: true,
                fillColor: widget.fillColor,
                enabledBorder: buildOutlineInputBorder(),
                border: buildOutlineInputBorder(),
                errorBorder: buildOutlineInputBorder(),
                errorText: widget.errorText,
                focusedErrorBorder: buildOutlineInputBorder(),
                focusedBorder: buildOutlineInputBorder(),
                labelText: widget.hintText,
                labelStyle: widget.obscure
                    ? AppTextStyles.r20.copyWith(color: AppColors.greyb4)
                    : AppTextStyles.r12,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: widget.prefexWidget != null
                    ? widget.prefexWidget
                    : widget.prefix.length == 0
                        ? null
                        : widget.prefix.contains('svg')
                            ? SvgPicture.asset(
                                widget.prefix,
                                fit: BoxFit.scaleDown,
                              )
                            : Image.asset(
                                widget.prefix,
                                fit: BoxFit.scaleDown,
                              ),
                suffixIcon: widget.suffexWidget != null
                    ? widget.suffexWidget
                    : widget.suffix.length != 0
                        ? GestureDetector(
                            onTap: () {
                              widget.obscure = !widget.obscure;
                              setState(() {});
                            },
                            child: SvgPicture.asset(
                              widget.suffix,
                              fit: BoxFit.scaleDown,
                            ),
                          )
                        : null)
            : InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                labelText: widget.hintText,
                labelStyle: AppTextStyles.r12.copyWith(
                    color: widget.blackLabel ? Colors.black : AppColors.grey87),
                contentPadding: EdgeInsetsDirectional.only(start: 16.w),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: widget.borderColor, width: 1),
    );
  }
}
