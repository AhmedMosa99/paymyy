import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/theme/app_text_styles.dart';
import 'package:paymyy/core/values/assets/app_icons.dart';
import 'package:paymyy/data/local_data/share_pref.dart';
import 'package:paymyy/modules/mainPage/main_controller.dart';
import 'package:paymyy/modules/mainPage/widgets/bill_widget.dart';
import 'package:paymyy/routes/app_routes.dart';
import 'package:paymyy/widgets/custom_tab_widget.dart';

import '../../../../core/values/assets/app_images.dart';
import '../../../../data/models/bill_model.dart';
import '../../../../data/models/electronic_model.dart';
import '../../../../shared/constant.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;

  final controller = Get.find<MainController>();

  Map<String, String> drawers = {
    "afawateer": AppIcons.tab22,
    "clients": AppIcons.tab44,
    "products": AppIcons.tab33,
    "requests": AppIcons.requests,
    "payment_links": AppIcons.paymentLinks,
    "returned_amounts": AppIcons.returnedAmounts
  };
  Map<String, String> starDrawers = {
    "profilePersonally": AppIcons.profilePersonally,
    "settings": AppIcons.settings,
    "support": AppIcons.support,
    "notifications": AppIcons.notifications,
    "signOut": AppIcons.signOut,
  };

  List<String> sliders = [
    "waiting_transaction",
    "transaction_number",
    "transaction_value",
    "avaliable_balance"
  ];
  bool tab1 = true, tab2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      onEndDrawerChanged: (x) => controller.setDrawerOPen(x),
      onDrawerChanged: (x) => controller.setDrawerOPen(x),
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        actions: [
          Builder(builder: (context) {
            return GestureDetector(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: SvgPicture.asset(AppIcons.drawer));
          }),
          SizedBox(
            width: 16.w,
          ),
        ],
        elevation: 0,
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Container(
                margin: EdgeInsetsDirectional.only(start: 16.w),
                child: const CircleAvatar(
                  backgroundImage: AssetImage(AppImages.profile),
                  radius: 35,
                )),
          );
        }),
      ),
      endDrawer: buildDrawer(),
      drawer: buildStartDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            buildCarouselSlider(),
            buildElectronics(),
            buildContainerCondition(),
            SizedBox(
              height: 20.h,
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (c, i) => SizedBox(
                      height: 10.h,
                    ),
                shrinkWrap: true,
                itemCount: bills.length,
                itemBuilder: (context, index) {
                  final bill = tab1 ? bills[index] : requests[index];
                  return BillWidget(bill: bill);
                })
          ],
        ),
      ),
    );
  }

  Container buildContainerCondition() {
    return Container(
      height: 40.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.grey87, width: 0.3),
        color: AppColors.greyf8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  tab1 = true;
                  tab2 = false;
                });
              },
              child: CustomTabWidget(isSelected: tab1, name: "new_fawateer")),
          GestureDetector(
              onTap: () {
                setState(() {
                  tab1 = false;
                  tab2 = true;
                });
              },
              child: CustomTabWidget(isSelected: tab2, name: "new_requests")),
        ],
      ),
    );
  }

  Container buildElectronics() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
      height: 120.h,
      child: ListView.separated(
        separatorBuilder: (c, i) => SizedBox(
          width: 18.w,
        ),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: electronics.length,
        itemBuilder: (c, i) => InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.servicesScreen);
          },
          child: Column(
            children: [
              Image.asset(electronics[i].image),
              SizedBox(
                height: 10.h,
              ),
              Text(
                electronics[i].name,
                style: AppTextStyles.b12.copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  CarouselSlider buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
          height: 125.0,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          reverse: false,
          enableInfiniteScroll: false,
          onPageChanged: (i, c) {
            setState(() {
              currentSlider = i;
            });
          }),
      items: sliders.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: 343.w,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '0.0 د.ك',
                      style: AppTextStyles.b30.copyWith(color: Colors.white),
                    ),
                    Text(
                      i.tr,
                      style: AppTextStyles.b12.copyWith(color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildDot(currentSlider == 0
                            ? AppColors.blue84
                            : Colors.white),
                        SizedBox(
                          width: 8.w,
                        ),
                        buildDot(currentSlider == 1
                            ? AppColors.blue84
                            : Colors.white),
                        SizedBox(
                          width: 8.w,
                        ),
                        buildDot(currentSlider == 2
                            ? AppColors.blue84
                            : Colors.white),
                        SizedBox(
                          width: 8.w,
                        ),
                        buildDot(currentSlider == 3
                            ? AppColors.blue84
                            : Colors.white),
                      ],
                    )
                  ],
                ));
          },
        );
      }).toList(),
    );
  }

  Container buildDot(Color color) {
    return Container(
      width: 10.w,
      height: 10.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  Builder buildDrawer() {
    return Builder(builder: (context) {
      return Container(
        width: ScreenUtil.defaultSize.width * 0.55,
        child: Drawer(
          backgroundColor: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 75.h,
                ),
                Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: GestureDetector(
                      onTap: () {
                        Scaffold.of(context).closeEndDrawer();
                      },
                      child: Container(
                          margin: EdgeInsetsDirectional.only(start: 20.w),
                          child: const Icon(
                            Icons.close,
                            color: Colors.black,
                          )),
                    )),
                ListView(
                    shrinkWrap: true,
                    children: drawers.entries
                        .map((e) => GestureDetector(
                              onTap: () {
                                if (e.key == "requests") {
                                  Get.toNamed(AppRoutes.requests);
                                  Scaffold.of(context).closeEndDrawer();
                                } else if (e.key == "payment_links") {
                                  Get.toNamed(AppRoutes.paymentLinks);
                                  Scaffold.of(context).closeEndDrawer();
                                } else if (e.key == "returned_amounts") {
                                  Get.toNamed(AppRoutes.returnedAmounts);
                                  Scaffold.of(context).closeEndDrawer();
                                } else {
                                  controller.setCurrentTab(getIndex(e.key));
                                  Scaffold.of(context).closeEndDrawer();
                                }
                              },
                              child: Container(
                                margin:
                                    EdgeInsetsDirectional.only(bottom: 40.h),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(e.value),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      e.key.tr,
                                      style: AppTextStyles.b16
                                          .copyWith(color: AppColors.primary),
                                    )
                                  ],
                                ),
                              ),
                            ))
                        .toList())
              ],
            ),
          ),
        ),
      );
    });
  }

  Builder buildStartDrawer() {
    return Builder(builder: (context) {
      return Container(
        width: ScreenUtil.defaultSize.width * 0.55,
        child: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 75.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Scaffold.of(context).closeEndDrawer();
                      },
                      child: Container(
                          margin: EdgeInsetsDirectional.only(start: 20.w),
                          child: const Icon(
                            Icons.close,
                            color: Colors.black,
                          )),
                    )),
              ),
              Container(
                height: 85.h,
                width: 100.w,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.fill,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          width: 22.w,
                          height: 22.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                  color: Color(0xff878787), width: .5.w)),
                          child: Center(
                              child: Icon(
                            Icons.edit,
                            color: Color(0xff878787),
                            size: 18.w,
                          ))),
                    )
                  ],
                ),
              ),
              ListView(
                  shrinkWrap: true,
                  children: starDrawers.entries
                      .map((e) => GestureDetector(
                            onTap: () {
                              if (e.key == "settings") {
                                Get.toNamed(AppRoutes.settingsScreen);
                                Scaffold.of(context).closeDrawer();
                              } else if (e.key == "support") {
                                Get.toNamed(AppRoutes.supportScreen);
                                Scaffold.of(context).closeDrawer();
                              } else if (e.key == "notifications") {
                                Get.toNamed(AppRoutes.notificationsScreen);
                                Scaffold.of(context).closeDrawer();
                              } else if (e.key == "signOut") {
                                Scaffold.of(context).closeDrawer();
                                setState(() {});
                                logoutDialog(context);
                              } else {
                                controller.setCurrentTab(getIndex(e.key));
                                Scaffold.of(context).closeEndDrawer();
                              }
                            },
                            child: Container(
                              margin: EdgeInsetsDirectional.only(bottom: 40.h),
                              child: Column(
                                children: [
                                  SvgPicture.asset(e.value),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    e.key.tr,
                                    style: AppTextStyles.b16
                                        .copyWith(color: AppColors.primary),
                                  )
                                ],
                              ),
                            ),
                          ))
                      .toList())
            ],
          ),
        ),
      );
    });
  }

  int getIndex(String val) {
    switch (val) {
      case "afawateer":
        return 1;
      case "clients":
        return 3;
      case "products":
        return 2;
      default:
        return 0;
    }
  }

  void logoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          content: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            height: 110.h,
            width: 337.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "doYouWantToLogOut".tr,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () async {
                          await SharePref.init();
                          await SharePref.removeKey("token");
                          token = null;
                          await Get.offNamed(AppRoutes.login);
                        },
                        child: Text(
                          "yes".tr,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700),
                        )),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "no".tr,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
