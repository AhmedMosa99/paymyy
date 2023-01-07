import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paymyy/core/theme/themes.dart';
import 'package:pinput/pinput.dart';

import 'app_colors.dart';

class AppTextStyles {
  static PinTheme defaultPinTheme = PinTheme(
      width: 44.w,
      height: 48.h,
      textStyle: const TextStyle(fontSize: 17, color: Colors.black),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: AppColors.primary),
      ));

  static TextStyle get b18 => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        fontFamily: AppThemes.getFontFamily(),
      );

  static TextStyle get b16 => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        fontFamily: AppThemes.getFontFamily(),
      );

  static TextStyle get b30 => TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.w700,
        fontFamily: AppThemes.getFontFamily(),
      );

  static TextStyle get b15 => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
        fontFamily: AppThemes.getFontFamily(),
      );

  static TextStyle get b12 => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        fontFamily: AppThemes.getFontFamily(),
      );

  static TextStyle get b20 => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        fontFamily: AppThemes.getFontFamily(),
      );

  static TextStyle get b24 => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AppThemes.getFontFamily(),
      );

  static TextStyle get b8 => TextStyle(
        fontSize: 7.5.sp,
        fontWeight: FontWeight.w500,
        fontFamily: AppThemes.getFontFamily(),
      );

  static TextStyle get b9 => TextStyle(
        fontSize: 9.sp,
        fontWeight: FontWeight.w500,
        fontFamily: AppThemes.getFontFamily(),
      );

  static TextStyle get b10 => TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        fontFamily: AppThemes.getFontFamily(),
      );

  static TextStyle get b14 => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        fontFamily: AppThemes.getFontFamily(),
      );

  static TextStyle get r12 => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppThemes.getFontFamily(),
      );

  static TextStyle get r10 => TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppThemes.getFontFamily(),
      );

  static TextStyle get r8 => TextStyle(
        fontSize: 8.sp,
        fontWeight: FontWeight.w500,
        fontFamily: AppThemes.getFontFamily(),
      );

  static TextStyle get r20 => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppThemes.getFontFamily(),
      );

  static TextStyle get r14 => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        fontFamily: AppThemes.getFontFamily(),
      );

  static TextStyle get ul14 => TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        fontFamily: AppThemes.getFontFamily(),
      );

  static TextStyle get r16 => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        fontFamily: AppThemes.getFontFamily(),
      );

  static TextStyle get rs17 => TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        fontFamily: AppThemes.getFontFamily(),
      );

  static TextStyle get mb20 => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        fontFamily: AppThemes.getFontFamily(),
      );
}
