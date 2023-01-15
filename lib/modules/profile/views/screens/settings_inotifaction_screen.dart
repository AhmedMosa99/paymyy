import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/modules/profile/views/widgets/fees_widgets.dart';

import '../widgets/Item_settings_notifcation_widget.dart';
class  NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          elevation: 0,
          title: Text("notificationSettings".tr,style:TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),),
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
            InkWell(
                onTap: (){
                  Get.back();
                },
                child: Center(child: Text("save".tr,style: TextStyle(color: Colors.black,fontSize: 14.sp,),))),
            SizedBox(width: 16.w,)
          ],
        ),
        body:Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (c,i){
                return  ItemSettingsWidget();
              }, separatorBuilder: (c,i){
            return SizedBox(height: 16.h,);
          }, itemCount: 10),
        )
    );
  }
}