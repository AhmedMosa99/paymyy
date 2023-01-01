import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../widgets/custom_tab_widget.dart';
class CreatePillPage extends StatefulWidget {
   CreatePillPage({Key? key}) : super(key: key);

  @override
  State<CreatePillPage> createState() => _CreatePillPageState();
}

class _CreatePillPageState extends State<CreatePillPage> {
bool tab1=true,tab2=false,tab3=false,tab4=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          "bill_create".tr,
          style: AppTextStyles.b20.copyWith(color: Colors.black),
        ),
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          buildContainerCondition(),
          SizedBox(
            height: 16.h,
          ),
        ],
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
                name:   "sms_massage",
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
                name:   "watsapp",
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
                name:  "alemail",
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
                name:   "link",
                isBill: true,
              )),
        ],
      ),
    );
  }
}
