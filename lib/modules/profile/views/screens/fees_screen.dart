import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../widgets/item_fees_widget.dart';
class  FeesScreen extends StatelessWidget {
  const FeesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        title: Text("fees".tr),
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
              child: Center(child: Text("save".tr,style: Theme.of(context).textTheme.bodyText2,))),
          SizedBox(width: 16.w,)
        ],
      ),
      body:ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (c,i){
        return  ItemFeesWidget(name: "كي نت",);
      }, separatorBuilder: (c,i){
        return SizedBox(height: 0.h,);
      }, itemCount: 1)
    );
  }
}




