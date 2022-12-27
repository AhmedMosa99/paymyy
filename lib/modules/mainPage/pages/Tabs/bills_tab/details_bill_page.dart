import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/routes/app_routes.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../widgets/custom_tile_info_widget.dart';

class DetailsBillPage extends StatelessWidget {
  const DetailsBillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 90.h,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "bill_details".tr,
          style: AppTextStyles.b20.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
            padding: EdgeInsetsDirectional.only(end: 10),
            icon: Icon(Icons.more_vert,color: Colors.black,),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    GestureDetector(
                     onTap: (){
                       Get.back();
                       Get.toNamed(AppRoutes.createPill);
                     } ,
                        child: Text("bill_recurrence".tr,style: AppTextStyles.b12,)),
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                        child: Icon(Icons.close,color: Colors.black,)),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Text(  "resend".tr,style: AppTextStyles.b12,),
              ),
              PopupMenuItem(
                value: 3,
                child: Text(  "cancel".tr,style: AppTextStyles.b12,),
              ),
            ],
            offset: Offset(0, 10),
            color: Colors.white
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildMainText("main_personal"),
            Divider(
              color: AppColors.grey87,
              height: 1,
            ),
            CustomTileInfoWidget(
                title: "bill_state",
                val: "not_paid".tr,
                color: AppColors.yellow1e),
            CustomTileInfoWidget(title: "bill_reference", val: "002202004"),
            CustomTileInfoWidget(
                title: "deposit_state",
                val: "غير مودعة",
                color: AppColors.red0e),
            CustomTileInfoWidget(
                title: "bill_link",
                val: "display".tr,
                isClick:true,
                color: AppColors.primary),
            CustomTileInfoWidget(title: "pill_value", val: "200.00دك"),
            CustomTileInfoWidget(title: "value_display_currency", val: "200.00دك"),
            CustomTileInfoWidget(title: "created_by", val: "Ali Mohammed"),
            CustomTileInfoWidget(title: "date_created", val: "1\1\2022"),
            CustomTileInfoWidget(title: "expired_date", val: "1\1\2022"),
            buildMainText("client_info"),
            Divider(
              color: AppColors.grey87,
              height: 1,
            ),
            CustomTileInfoWidget(title: "client_name", val: "Ali Mohammed"),
            CustomTileInfoWidget(title: "client_mobile", val: "0000000000"),
            buildMainText("more_options"),
            Divider(
              color: AppColors.grey87,
              height: 1,
            ),
            CustomTileInfoWidget(title: "sends_options", val: "رسائل قصيرة"),
            CustomTileInfoWidget(title: "send_numbers", val: "2"),
            CustomTileInfoWidget(title: "number_of_display", val: "2"),
            CustomTileInfoWidget(title: "send_emails", val: "2"),
            CustomTileInfoWidget(title: "remmeber_later", val: "2"),
            buildMainText("payment_process"),
            Divider(
              color: AppColors.grey87,
              height: 1,
            ),
            CustomTileInfoWidget(title: "transaction_date", val: "1\1\2022"),
            CustomTileInfoWidget(title: "process_state", val: "Failed"),
            CustomTileInfoWidget(title: "payment_gateway", val: "كي نت"),
            CustomTileInfoWidget(title: "pay_no", val: "1876600012022"),
            CustomTileInfoWidget(title: "authorization_number", val: "1876600012022"),
            CustomTileInfoWidget(title: "follow_no", val: "1876600_01\2\ 2022"),
            CustomTileInfoWidget(title: "process_no", val: "1876600012022"),
            CustomTileInfoWidget(title: "reference_no", val: "18766009985012022"),
            CustomTileInfoWidget(title: "mistake", val: "Transaction Failed"),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }



  Container buildMainText(String text) {
    return Container(
      height: 40.h,
      child: ListTile(
          title: Text(
        text.tr,
        style: AppTextStyles.b14.copyWith(color: AppColors.primary),
      )),
    );
  }
}
