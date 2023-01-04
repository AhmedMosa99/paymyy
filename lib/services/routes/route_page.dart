import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pay_myy/modules/payment_links/veiws/screnns/add_links_screen.dart';
import 'package:pay_myy/modules/payment_links/veiws/screnns/descraption_link_sscreen.dart';
import 'package:pay_myy/modules/payment_links/veiws/screnns/payment_links_screen.dart';
import 'package:pay_myy/modules/profile/views/screens/fees_screen.dart';
import 'package:pay_myy/modules/profile/views/screens/social_media_screen.dart';
import 'package:pay_myy/services/routes/route_name.dart';
List<GetPage>? getPages = [
  GetPage(
      name: RoutesName.paymentLinkScreen,
      page: () => const PaymentLinkScreen(),
      ),
  GetPage(
    name: RoutesName.addLinksScreen,
    page: () => const AddLinksScreen(),
  ),
  GetPage(
    name: RoutesName.descriptionLinksScreen,
    page: () => const DetailsLinksScreen(),
  ),
  GetPage(
    name: RoutesName.feesScreen,
    page: () => const FeesScreen(),
  ),
  GetPage(
    name: RoutesName.socialMediaScreen,
    page: () => const SocialMediaScreen(),
  ),

];
