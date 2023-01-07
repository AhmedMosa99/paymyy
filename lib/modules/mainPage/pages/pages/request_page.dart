import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paymyy/routes/app_routes.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/values/assets/app_icons.dart';
import '../../widgets/custom_tab_widget.dart';
import '../../widgets/sort_sheet_widget.dart';

class RequestsPage extends StatefulWidget {
  RequestsPage({Key? key}) : super(key: key);

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  bool tab1 = true, tab2 = false, tab3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "requests".tr,
          style: AppTextStyles.b20.copyWith(color: Colors.black),
        ),
        toolbarHeight: 80.h,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
              onTap: () {}, child: SvgPicture.asset(AppIcons.search)),
          SizedBox(
            width: 16.w,
          ),
          GestureDetector(
              onTap: () {
                Get.bottomSheet(
                  const SortSheetWidget(),
                  ignoreSafeArea: true,
                  barrierColor: Colors.black26,
                  isScrollControlled: true,
                  enableDrag: false,
                  isDismissible: false,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(25),
                      topStart: Radius.circular(25),
                    ),
                  ),
                );
              },
              child: SvgPicture.asset(AppIcons.filter)),
          SizedBox(
            width: 16.w,
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildContainerCondition(),
            SizedBox(
              height: 16.h,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (c, i) => SizedBox(
                height: 10.h,
              ),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (c, i) => GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.detailsPillRequest);
                },
                child: Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: AppColors.whitef3, width: 0.7)),
                  child: Container(
                    height: 145.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          visualDensity: const VisualDensity(vertical: -4),
                          leading: Text(
                            'سارة محمد الخالد',
                            style: AppTextStyles.b12,
                          ),
                          trailing: Text(
                            '50.000 د.ك',
                            style: AppTextStyles.r14
                                .copyWith(color: AppColors.primary),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              '12\10\2022',
                              style: AppTextStyles.r10
                                  .copyWith(color: Colors.black),
                            )),
                        Divider(
                          color: AppColors.grey87,
                        ),
                        ListTile(
                          visualDensity: const VisualDensity(vertical: -4),
                          leading: Text(
                            "request_type".tr + ' :',
                            style: AppTextStyles.r14,
                          ),
                          title: Text(
                            'API',
                            style: AppTextStyles.r12
                                .copyWith(color: AppColors.grey87),
                          ),
                        ),
                        ListTile(
                          visualDensity: const VisualDensity(vertical: -4),
                          leading: Text(
                            "request_state".tr + ' :',
                            style: AppTextStyles.r14,
                          ),
                          title: Text(
                            "not_excute".tr,
                            style: AppTextStyles.r12
                                .copyWith(color: AppColors.yellow1e),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
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
                  tab3 = false;
                });
              },
              child: CustomTabWidget(
                isSelected: tab1,
                name: "not_paid",
                isBill: true,
              )),
          GestureDetector(
              onTap: () {
                setState(() {
                  tab1 = false;
                  tab3 = false;
                  tab2 = true;
                });
              },
              child: CustomTabWidget(
                isSelected: tab2,
                name: "paied_pills",
                isBill: true,
              )),
          GestureDetector(
              onTap: () {
                setState(() {
                  tab1 = false;
                  tab2 = false;
                  tab3 = true;
                });
              },
              child: CustomTabWidget(
                isSelected: tab3,
                name: "paied_test",
                isBill: true,
              )),
        ],
      ),
    );
  }
}
