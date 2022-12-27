import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/theme/app_text_styles.dart';
import 'package:paymyy/core/values/assets/app_icons.dart';

import '../../../../core/values/assets/app_images.dart';
import '../../../../data/models/bill_model.dart';
import '../../../../data/models/electronic_model.dart';
import '../../main_controller.dart';
import '../../widgets/bill_widget.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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
        leading: Container(
            margin: EdgeInsetsDirectional.only(start: 16.w),
            child: CircleAvatar(
              backgroundImage: AssetImage(AppImages.profile),
              radius: 35,
            )),
      ),
      endDrawer: buildDrawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            buildCarouselSlider(),
            buildElectronics(),
            buildContainerCondition(),
            SizedBox(
              height: 20.h,
            ),
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
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
              child: customTab(tab1, "new_fawateer")),
          GestureDetector(
              onTap: () {
                setState(() {
                  tab1 = false;
                  tab2 = true;
                });
              },
              child: customTab(tab2, "new_requests")),
        ],
      ),
    );
  }

  Widget customTab(bool isSelected, String name) {
    return Container(
      width: 150.w,
      height: 30.h,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.greyf8,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(
        name.tr,
        style: AppTextStyles.b12
            .copyWith(color: isSelected ? Colors.white : AppColors.black22),
      )),
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
        itemBuilder: (c, i) => Column(
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
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        )),
                  )),
              ListView(
                  shrinkWrap: true,
                  children: drawers.entries
                      .map((e) => GestureDetector(
                            onTap: () {
                              controller.setCurrentTab(getIndex(e.key));
                              Scaffold.of(context).closeEndDrawer();
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
}
