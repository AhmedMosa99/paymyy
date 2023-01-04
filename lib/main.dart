
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pay_myy/modules/payment_links/veiws/screnns/payment_links_screen.dart';
import 'package:pay_myy/modules/profile/views/screens/fees_screen.dart';
import 'package:pay_myy/services/routes/route_page.dart';
import 'package:pay_myy/shared/binding.dart';

import 'modules/profile/views/screens/social_media_screen.dart';
import 'utils/languages/translation.dart';
import 'utils/themes/light_theme.dart';

void main() async {
  runApp(const StartScreen());
}

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, s) => GetMaterialApp(
        smartManagement: SmartManagement.onlyBuilder,
        initialBinding:  ControllerBinding(),
        translations: Messages(),
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        locale:const Locale("ar"),
        fallbackLocale:const Locale('ar'),
        //if you want to روابط الدفع put PaymentLinkScreen() in home
        //if you want to وسائل التواصل الاجتماعي put  SocialMediaScreen(),in home
        //if you want to الرسوم put  FeesScreen(),in home
        home:const FeesScreen(),
        getPages: getPages,
      ),
    );
  }
}
