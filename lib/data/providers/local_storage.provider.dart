import 'package:get_storage/get_storage.dart';

class LocalStrorageProvider {
  static const String _locale = "localKey";
  static const String _enter = "EnterKey";

  static const String _token = "token";
  static const String _userId = "user_id";

  static const String _isDarkMode = "isDarkMode";

  static String? get token {
    return GetStorage().read<String?>(_token);
  }

  static int? get userId {
    return GetStorage().read<int?>(_userId);
  }





  static String get locale {
    return GetStorage().read<String?>(_locale) ?? "ar.dart";
  }



  static bool get isDarkMode {
    return GetStorage().read<bool>(_isDarkMode) ?? false;
    // (SchedulerBinding.instance.platformDispatcher.platformBrightness ==
    //     Brightness.dark);
  }
static bool get isEnter{
    return GetStorage().read<bool>(_enter)??false;
}
  static setLanguage(String locale) async {
    await GetStorage().write(_locale, locale);
  }

  static setEnter(bool isEnter) async {
    await GetStorage().write(_enter, isEnter);
  }

  static setDarkMode(bool isDarkmode) async {
    await GetStorage().write(_isDarkMode, isDarkmode);
  }

  static setToken(String token) async {
    await GetStorage().write(_token, token);
  }

  static setUserId(int userId) async {
    await GetStorage().write(_userId, userId);
  }



}
