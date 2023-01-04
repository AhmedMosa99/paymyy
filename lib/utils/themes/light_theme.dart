import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
    iconTheme: const IconThemeData(color: Color(0xff000000), size: 12),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color(0xffFFFFFF),
        selectedItemColor: const Color(0xff009CD9),
        selectedLabelStyle: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xff009CD9)),
        unselectedLabelStyle:
            TextStyle(fontSize: 13.sp, color: const Color(0xff707070)),
        unselectedItemColor: const Color(0xffBDBDBD)),
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            fontSize: 20.sp, color: Colors.black, fontWeight: FontWeight.w600,  fontFamily: GoogleFonts.tajawal().fontFamily,),
        centerTitle: true,
        iconTheme:  IconThemeData(color: Colors.black, size: 21.w),
        backgroundColor: HexaColor.fromHexa('#FFFFFF'),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
            statusBarColor: Color(0xffffffff))),
    fontFamily: GoogleFonts.tajawal().fontFamily,
    primaryColor: const Color(0xff009CD9),
    textTheme: TextTheme(
        subtitle1:
            TextStyle(fontSize: 14.sp, color:const Color(0xff009CD9),fontWeight: FontWeight.bold, fontFamily: GoogleFonts.tajawal().fontFamily,
            ),
        subtitle2: TextStyle(
            fontSize: 10.sp,
            color: const Color(0xff878787),
            fontWeight: FontWeight.w600,fontFamily: GoogleFonts.tajawal().fontFamily,
        ),
        headline2: TextStyle(
            fontSize: 20.sp,
            color: const Color(0xff000000),
            fontFamily: GoogleFonts.tajawal().fontFamily,
            fontWeight: FontWeight.bold),
      bodyText1:  TextStyle(
          fontSize: 15.sp,
          fontFamily: GoogleFonts.tajawal().fontFamily,
          color: const Color(0xff000000),
          fontWeight: FontWeight.w600),
      bodyText2: TextStyle(
          fontSize: 15.sp,
          fontFamily: GoogleFonts.tajawal().fontFamily,
          color: const Color(0xff000000),
          fontWeight: FontWeight.w600),
       ),
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            alignment: Alignment.center, backgroundColor: const Color(0xff009CD9),
            textStyle: TextStyle(
              fontFamily: GoogleFonts.tajawal().fontFamily,
              fontSize: 15.sp,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w600
            ),
            fixedSize: Size(double.infinity, 40.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)))),
 );

extension HexaColor on Color {
  static Color fromHexa(String hexa) {
    hexa = hexa.replaceAll('#', '');
    if (hexa.length == 6) {
      hexa = "FF$hexa";
    }
    return Color(int.parse(hexa, radix: 16));
  }
}
