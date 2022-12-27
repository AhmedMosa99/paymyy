import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/language_model.dart';
import '../../data/providers/local_storage.provider.dart';
import 'app_colors.dart';

class AppThemes {
  // there will be more code here and if too much will be separated in different files
  static ThemeData dark = ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      highlightColor: AppColors.secondary,
      colorScheme: ColorScheme.dark(
          secondary: AppColors.secondary, primary: AppColors.primary),
      fontFamily: getFontFamily());

  static ThemeData light = ThemeData(
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
        languageModel.languageCode?.toLowerCase() ?? "en",);
    Get.updateLocale(Locale(languageModel.languageCode?.toLowerCase() ?? "en"));
  }

  static bool isRtl() {
    if (LocalStrorageProvider.locale == "ar") {
      return true;
    }
    return false;
  }

  static String getFontFamily() {
    if (LocalStrorageProvider.locale == "ar") {
      return GoogleFonts.tajawal().fontFamily ?? "";
    } else {
      return GoogleFonts.roboto().fontFamily ?? "";
    }
  }
}