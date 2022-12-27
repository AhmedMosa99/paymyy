import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:paymyy/modules/login/pages/code_check_page.dart';
import 'package:paymyy/modules/login/pages/create_password_page.dart';
import 'package:paymyy/modules/login/pages/passord_returned_page.dart';
import 'package:paymyy/modules/on_boarding/pages/on_boarding_page.dart';
import 'package:paymyy/modules/splash/pages/language_page.dart';

import '../modules/login/pages/login_page.dart';
import '../modules/mainPage/pages/main_page.dart';
import '../modules/singup/pages/signup_page.dart';
import '../modules/splash/pages/splash_page.dart';
import 'app_routes.dart';

class AppPages{
  static List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => SplashPage()),
    GetPage(name: AppRoutes.language, page: () => LanguagePage()),
    GetPage(name: AppRoutes.boarding, page: () => OnboardingPage()),
    GetPage(name: AppRoutes.login, page: () => LoginPage()),
    GetPage(name: AppRoutes.signup, page: () => SignupPage()),
    GetPage(name: AppRoutes.mainPage, page: () => MainPage()),
    GetPage(name: AppRoutes.passordReturned, page: () => PassordReturnedPage()),
    GetPage(name: AppRoutes.codeCheck, page: () => CodeCheckPage()),
    GetPage(name: AppRoutes.createPassword, page: () => CreatePasswordPage()),
  ];
}