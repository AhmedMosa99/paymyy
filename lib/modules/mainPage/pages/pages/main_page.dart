import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/theme/app_text_styles.dart';
import 'package:paymyy/core/values/assets/app_icons.dart';
import 'package:paymyy/modules/mainPage/pages/Tabs/bills_tab/bills_page.dart';
import 'package:paymyy/modules/mainPage/pages/Tabs/products_tab.dart';

import '../../../../routes/app_routes.dart';
import '../../main_controller.dart';
import '../Tabs/clientTab/clients_tab.dart';
import '../../../home/views/screens/home_tab.dart';

class MainPage extends StatelessWidget {
  final controller = Get.put(MainController());
  List<Widget> screens = [
    HomeScreen(),
    const BillsPage(),
    const ProductsTab(),
    const ClientsTab()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (logic) {
        return Scaffold(
          body: screens[controller.currentTab],
          floatingActionButton: controller.isDrawer
              ? const SizedBox()
              : FloatingActionButton(
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Get.toNamed(AppRoutes.createPill);
                  },
                ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: controller.isDrawer
              ? const SizedBox()
              : BottomAppBar(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(bottom: 2.h),
                    decoration: BoxDecoration(
                      color: AppColors.graye2.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 80.h,
                    child: Row(
                      children: [
                        buildBottomTab("home", 0, 30, 40),
                        buildBottomTab("fawateer", 1, 30, 90),
                        buildBottomTab("products", 2, 10, 50),
                        buildBottomTab("clients", 3, 10, 10),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  Widget buildBottomTab(String name, int index, double start, double end) {
    return GestureDetector(
      onTap: () {
        controller.setCurrentTab(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(start: start.w, end: end.w),
            child: SvgPicture.asset(controller.currentTab == index
                ? getSelectedIcon(index)
                : getIcon(index)),
          ),
          SizedBox(
            height: 4.h,
          ),
          Visibility(
            visible: controller.currentTab == index,
            child: Container(
                margin: EdgeInsetsDirectional.only(start: start),
                child: Text(
                  name.tr,
                  style: AppTextStyles.r10.copyWith(color: AppColors.primary),
                )),
          )
        ],
      ),
    );
  }
}

String getIcon(int index) {
  switch (index) {
    case 0:
      return AppIcons.tab1;
    case 1:
      return AppIcons.tab2;
    case 2:
      return AppIcons.tab3;
    case 3:
      return AppIcons.tab4;
    default:
      return AppIcons.tab1;
  }
}

String getSelectedIcon(int index) {
  switch (index) {
    case 0:
      return AppIcons.tab11;
    case 1:
      return AppIcons.tab22;
    case 2:
      return AppIcons.tab33;
    case 3:
      return AppIcons.tab44;
    default:
      return AppIcons.tab11;
  }
}
