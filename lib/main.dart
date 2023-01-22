import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paymyy/data/local_data/share_pref.dart';
import 'package:paymyy/routes/app_pages.dart';
import 'package:paymyy/routes/app_routes.dart';
import 'package:paymyy/routes/bindings/app_binding.dart';
import 'package:paymyy/modules/auth/controllers/auth_binding.dart';
import 'package:paymyy/shared/main_binding.dart';

import 'core/theme/themes.dart';
import 'core/values/languages/translations.dart';
import 'data/providers/local_storage.provider.dart';
import 'shared/constant.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharePref.init();
  token= await SharePref.getData(key: 'token');
  print(token);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (c, _) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: AppPages.pages,
          defaultTransition: Transition.fade,
          locale: Locale(LocalStrorageProvider.locale),
          fallbackLocale: const Locale("en"),
          supportedLocales:const [ Locale("ar"),  Locale("en")],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          themeMode: AppThemes.themeMode,
          translations: AppTranslations(),
          initialBinding:token!=null? MainBinding():AuthBinding(),
          initialRoute: AppRoutes.splash,
        );
      },
    );
  }
}
