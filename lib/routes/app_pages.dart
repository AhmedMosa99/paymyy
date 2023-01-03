import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:paymyy/modules/login/pages/code_check_page.dart';
import 'package:paymyy/modules/login/pages/create_password_page.dart';
import 'package:paymyy/modules/login/pages/passord_returned_page.dart';
import 'package:paymyy/modules/mainPage/pages/Tabs/bills_tab/details_bill_page.dart';
import 'package:paymyy/modules/mainPage/pages/Tabs/addTab/product_create_page.dart';
import 'package:paymyy/modules/on_boarding/pages/on_boarding_page.dart';
import 'package:paymyy/modules/splash/pages/language_page.dart';

import '../modules/login/pages/login_page.dart';
import '../modules/mainPage/pages/Tabs/bills_tab/display_bill_page.dart';
import '../modules/mainPage/pages/Tabs/bills_tab/pill_redunduncy_page.dart';
import '../modules/mainPage/pages/Tabs/clientTab/new_client_page.dart';
import '../modules/mainPage/pages/pages/_bill_link_create_page.dart';
import '../modules/mainPage/pages/pages/bill_link_details_page.dart';
import '../modules/mainPage/pages/pages/details_request_page.dart';
import '../modules/mainPage/pages/pages/main_page.dart';
import '../modules/mainPage/pages/pages/payments_link_page.dart';
import '../modules/mainPage/pages/pages/request_page.dart';
import '../modules/mainPage/pages/pages/returned_amounts_page.dart';
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
    GetPage(name: AppRoutes.detailsBill, page: () => DetailsBillPage()),
    GetPage(name: AppRoutes.billDisplay, page: () => DisplayBillPage()),
    GetPage(name: AppRoutes.redunduncePill, page: () => PillRedunduncyPage()),
    GetPage(name: AppRoutes.createPill, page: () => ProductcreationPage()),
    GetPage(name: AppRoutes.newClient, page: () => NewClientPage()),
    GetPage(name: AppRoutes.requests, page: () => RequestsPage()),
    GetPage(name: AppRoutes.returnedAmounts, page: () => ReturnedAmountsPage()),
    GetPage(name: AppRoutes.paymentLinks, page: () => PaymentLinkPage()),
    GetPage(name: AppRoutes.detailsPillRequest, page: () => DetailsRequestPage()),
    GetPage(name: AppRoutes.pillLinkCreate, page: () => BillLinkCreatePage()),
    GetPage(name: AppRoutes.pillLinkDetails, page: () => BillLinkDetailsPage()),
  ];
}