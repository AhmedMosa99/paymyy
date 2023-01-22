import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paymyy/modules/home/controllers/home_controller.dart';
import 'package:paymyy/modules/home/views/widgets/client_item_widget.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/values/assets/app_icons.dart';
import '../../../../routes/app_routes.dart';

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({Key? key}) : super(key: key);

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "clients".tr,
          style: AppTextStyles.b20.copyWith(color: Colors.black),
        ),
        toolbarHeight: 80.h,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.newClient);
              },
              child: SvgPicture.asset(AppIcons.clientsAdd)),
          SizedBox(
            width: 16.w,
          ),
        ],
        elevation: 0,
      ),
      body: GetBuilder<HomeController>(
        builder: (logic) {
          return ListView.builder(
            itemCount: logic.dataCustomer.length,
            itemBuilder: (c, i) {
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: AppColors.greyd9, width: 0.7)),
                child: ClientItem(dataCustomer:logic.dataCustomer[i] ),
              );
            },
          );
        }
      ),
    );
  }
}

