import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pay_myy/utils/component/component.dart';
import 'package:pay_myy/utils/themes/light_theme.dart';

import '../widgets/details_payment_link_widget.dart';
import '../widgets/invoice_details_widget.dart';
class  AddLinksScreen extends StatelessWidget {
  const AddLinksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("paymentsLink".tr),
        leading: Platform.isIOS? InkWell(
            onTap: (){
              Get.back();
            },
            child: InkWell(
                onTap: (){
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios,size: 21.sp,))):Icon(Icons.arrow_back,size: 21.sp,),
        actions: [
          SvgPicture.asset('assets/images/clarity_search-line.svg'),
          SizedBox(width: 12.w,),
          SvgPicture.asset('assets/images/clarity_filter-2-line.svg'),
          SizedBox(width: 16.w,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentLinkDetailsWidget(),
            SizedBox(height: 20.h,),
            InvoiceDetailsWidget(),
            SizedBox(height: 10.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 52.w),
              child: SizedBox(height: 40.h,width: double.infinity,child: ElevatedButton(onPressed: (){},child: Text("CreateTheLink".tr),),),
            ),

          ],
        ),
      ),
    );
  }
}


