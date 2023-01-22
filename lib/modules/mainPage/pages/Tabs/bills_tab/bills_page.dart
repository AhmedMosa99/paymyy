import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_text_styles.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/values/assets/app_icons.dart';
import '../../../../../data/models/bill_model.dart';
import '../../../../../widgets/custom_tab_widget.dart';
import '../../../widgets/bill_widget.dart';
import '../../../widgets/sort_sheet_widget.dart';

class BillsPage extends StatefulWidget {
  const BillsPage({Key? key}) : super(key: key);

  @override
  State<BillsPage> createState() => _BillsPageState();
}

class _BillsPageState extends State<BillsPage> {
  bool tab1 = true, tab2 = false, tab3 = false, tab4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "afawateer".tr,
          style: AppTextStyles.b20.copyWith(color: Colors.black),
        ),
        toolbarHeight: 100.h,
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
                  SortSheetWidget(),
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
      body: Column(
        children: [
          buildContainerCondition(),
          SizedBox(
            height: 20.h,
          ),
          buildListView()
        ],
      ),
    );
  }

  ListView buildListView() {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (c, i) => SizedBox(
              height: 10.h,
            ),
        shrinkWrap: true,
        itemCount: bills.length,
        itemBuilder: (context, index) {
          final bill = tab1
              ? notPaied[index]
              : tab2
                  ? paied[index]
                  : tab3
                      ? putted[index]
                      : canceled[index];
          return BillWidget(bill: bill);
        });
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
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  tab1 = true;
                  tab2 = false;
                  tab3 = false;
                  tab4 = false;
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
                  tab4 = false;
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
                  tab4 = false;
                });
              },
              child: CustomTabWidget(
                isSelected: tab3,
                name: "paied_test",
                isBill: true,
              )),
          GestureDetector(
              onTap: () {
                setState(() {
                  tab1 = false;
                  tab2 = false;
                  tab3 = false;
                  tab4 = true;
                });
              },
              child: CustomTabWidget(
                isSelected: tab4,
                name: "paied_cancel",
                isBill: true,
              )),
        ],
      ),
    );
  }
}
