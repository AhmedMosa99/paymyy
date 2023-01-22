import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:paymyy/modules/mainPage/pages/Tabs/addTab/product_create_page.dart';
import 'package:paymyy/modules/mainPage/pages/Tabs/bills_tab/details_bill_page.dart';
import 'package:paymyy/modules/on_boarding/pages/on_boarding_page.dart';
import 'package:paymyy/modules/profile/views/screens/discount_screen.dart';
import 'package:paymyy/modules/profile/views/screens/fees_screen.dart';
import 'package:paymyy/modules/profile/views/screens/notifactions_screen.dart';
import 'package:paymyy/modules/profile/views/screens/settings_inotifaction_screen.dart';
import 'package:paymyy/modules/profile/views/screens/settings_screen.dart';
import 'package:paymyy/modules/profile/views/screens/soical_screen.dart';
import 'package:paymyy/modules/profile/views/screens/support_screen.dart';
import 'package:paymyy/modules/services/views/screens/services.dart';
import 'package:paymyy/modules/splash/pages/language_page.dart';
import 'package:paymyy/shared/main_binding.dart';
import '../modules/auth/views/screens/code_check_page.dart';
import '../modules/auth/views/screens/create_password_page.dart';
import '../modules/auth/views/screens/login_page.dart';
import '../modules/auth/views/screens/passord_returned_page.dart';
import '../modules/auth/views/screens/signup_page.dart';
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
import '../modules/profile/views/screens/privacy_policy_screen.dart';
import '../modules/splash/pages/splash_page.dart';
import 'app_routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => SplashPage()),
    GetPage(name: AppRoutes.language, page: () => LanguagePage()),
    GetPage(name: AppRoutes.boarding, page: () => OnboardingPage()),
    GetPage(name: AppRoutes.login, page: () => LoginPage()),
    GetPage(name: AppRoutes.signup, page: () => SignupPage()),
    GetPage(name: AppRoutes.mainPage, page: () => MainPage(),binding: MainBinding()),
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
    GetPage(
        name: AppRoutes.detailsPillRequest, page: () => DetailsRequestPage()),
    GetPage(name: AppRoutes.pillLinkCreate, page: () => BillLinkCreatePage()),
    GetPage(name: AppRoutes.pillLinkDetails, page: () => BillLinkDetailsPage()),
    GetPage(name: AppRoutes.settingsScreen, page: () => SettingsScreen(),),
    GetPage(name: AppRoutes.feesScreen, page: () => FeesScreen()),
    GetPage(name: AppRoutes.socialMediaScreen, page: () => SocialMediaScreen()),
    GetPage(name: AppRoutes.discountScreen, page: () => DiscountScreen()),
    GetPage(name: AppRoutes.notificationSettingsScreen, page: () => NotificationSettingsScreen()),
    GetPage(name: AppRoutes.termScreen, page: () => TermScreen()),
    GetPage(name: AppRoutes.supportScreen, page: () => SupportScreen()),
    GetPage(name: AppRoutes.notificationsScreen, page: () => NotificationScreen()),
    GetPage(name: AppRoutes.servicesScreen, page: () => ServicesScreen()),
  ];
}
