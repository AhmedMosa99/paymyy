import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/values/assets/app_images.dart';
import 'package:paymyy/routes/app_routes.dart';
import 'package:paymyy/shared/constant.dart';

import '../../../data/providers/local_storage.provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    Future.delayed(const Duration(seconds: 3)).then((value) {
      // LocalStrorageProvider.isEnter
      //     ? Get.offNamed(AppRoutes.login)
      //     : Get.offNamed(AppRoutes.language);
     if( token!=null){
       Get.offNamed(AppRoutes.mainPage);
      }else{
      Get.offNamed(AppRoutes.login);
    }});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Image.asset(AppImages.icon),
    );
  }
}
