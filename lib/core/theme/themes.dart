import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/language_model.dart';
import '../../data/providers/local_storage.provider.dart';
import 'app_colors.dart';

class AppThemes {
  // there will be more code here and if too much will be separated in different files
  static ThemeData dark = ThemeData(
      brightness: Brightness.dark,
      canvasColor: Colors.grey,
      primaryColor: AppColors.primary,
      highlightColor: AppColors.secondary,
      colorScheme: ColorScheme.dark(
          secondary: AppColors.secondary, primary: AppColors.primary),
      fontFamily: getFontFamily());

  static ThemeData light = ThemeData(
    textTheme: TextTheme(
      bodyText2: TextStyle(fontSize: 16.sp,fontFamily:  GoogleFonts.tajawal().fontFamily ),
      bodyText1: TextStyle(fontSize: 16.sp,fontFamily:  GoogleFonts.tajawal().fontFamily ),
    ),
    appBarTheme:
        AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20.sp,
              fontFamily: getFontFamily(),
              color: Colors.black,
            ),
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black, size: 20.w),
            backgroundColor: Colors.white,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.dark,
                statusBarColor: Colors.white)),
      scaffoldBackgroundColor: Colors.white,
      canvasColor: Colors.grey,
      brightness: Brightness.light,
      highlightColor: AppColors.secondary,
      colorScheme: ColorScheme.light(
          secondary: AppColors.secondary, primary: AppColors.primary),
      fontFamily: getFontFamily());

  static ThemeMode get themeMode =>
      LocalStrorageProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light;

  static changeTheme() async {
    bool isDarkMode = !LocalStrorageProvider.isDarkMode;
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);

    await LocalStrorageProvider.setDarkMode(isDarkMode);
    Get.forceAppUpdate();
  }

  static changeLocale(LanguageModel languageModel) async {
    print(languageModel.languageCode);
    print(languageModel.languageID);

    await LocalStrorageProvider.setLanguage(
      languageModel.languageCode?.toLowerCase() ?? "en.dart",
    );
    Get.updateLocale(
        Locale(languageModel.languageCode?.toLowerCase() ?? "en.dart"));
  }

  static bool isRtl() {
    if (LocalStrorageProvider.locale == "ar.dart") {
      return true;
    }
    return false;
  }

  static String getFontFamily() {
    if (LocalStrorageProvider.locale == "ar.dart") {
      return GoogleFonts.tajawal().fontFamily ?? "";
    } else {
      return GoogleFonts.roboto().fontFamily ?? "";
    }
  }
}
