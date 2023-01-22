import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paymyy/modules/home/controllers/home_controller.dart';
import 'package:paymyy/modules/services/views/screens/services.dart';
import '../../../../core/theme/app_text_styles.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (logic) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
        height: 120.h,
        child: ListView.separated(
          separatorBuilder: (c, i) => SizedBox(
            width: 18.w,
          ),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: logic.servicesModel!.data!.length,
          itemBuilder: (c, i) => InkWell(
            onTap: () {
              Get.to(ServicesScreen(
                name: logic.servicesModel!.data![i].name!,
                description: logic.servicesModel!.data![i]!.description,
                id: logic.servicesModel!.data![i].id!,
                logo: logic.servicesModel!.data![i].logo,
                assigned:logic.servicesModel!.data![i].assigned,
              ));
            },
            child: Column(
              children: [
                Image.network(
                  logic.servicesModel!.data![i].logo!,
                  width: 65.w,
                  height: 65.h,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 32.h,
                  width: 72.w,
                  child: Text(
                    logic.servicesModel!.data![i].name!,
                    style: AppTextStyles.b12.copyWith(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
