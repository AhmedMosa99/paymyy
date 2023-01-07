import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paymyy/core/theme/app_text_styles.dart';
import 'package:paymyy/routes/app_routes.dart';

import '../../../core/theme/app_colors.dart';
import '../../../data/models/boarding_model.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: GestureDetector(
              onTap: () {
                Get.offNamed(AppRoutes.login);
              },
              child: Text(
                currentIndex == 5 ? '' : "skip".tr,
                style: AppTextStyles.r14.copyWith(color: Colors.black),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(top: 40.h),
            height: ScreenUtil.defaultSize.height * 0.75,
            child: PageView.builder(
              controller: _controller,
              itemCount: boardings.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    Image.asset(
                      boardings[i].image,
                    ),
                    Text(
                      boardings[i].title.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.rs17.copyWith(color: Colors.black),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              boardings.length,
              (index) => buildDot(index),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              height: 51.h,
              width: 51.w,
              child: ElevatedButton(
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (currentIndex == boardings.length - 1) {
                    Get.offNamed(AppRoutes.login);
                  }
                  _controller?.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.fastOutSlowIn,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index) {
    return Container(
      height: 10,
      width: 10,
      margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? AppColors.blue84 : AppColors.greyd2,
      ),
    );
  }
}
