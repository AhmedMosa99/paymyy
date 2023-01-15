import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/modules/profile/views/widgets/fees_widgets.dart';
class  FeesScreen extends StatelessWidget {
  const FeesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          elevation: 0,
          title: Text("fees".tr,style:TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700),),
          actions: [
            InkWell(
                onTap: (){
                  Get.back();
                },
                child: Center(child: Text("save".tr,style: TextStyle(color: Colors.black,fontSize: 14.sp,),))),
            SizedBox(width: 16.w,)
          ],
        ),
        body:ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (c,i){
              return  ItemFeesWidget(name: "كي نت",);
            }, separatorBuilder: (c,i){
          return SizedBox(height: 0.h,);
        }, itemCount: 2)
    );
  }
}