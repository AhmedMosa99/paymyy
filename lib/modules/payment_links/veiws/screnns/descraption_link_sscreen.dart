import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pay_myy/modules/payment_links/controllers/payment_link_controller.dart';
import 'package:pay_myy/utils/component/component.dart';
import 'package:pay_myy/utils/themes/light_theme.dart';
class  DetailsLinksScreen extends StatelessWidget {
  const DetailsLinksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("DescriptionLinksScreen".tr),
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
             child: Center(child: Text("cancel".tr,style: Theme.of(context).textTheme.bodyText2,))),
          SizedBox(width: 16.w,)
        ],
      ),
      body: SingleChildScrollView(
        child: GetBuilder<PaymentLinkController>(
          builder: (logic) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 10.h),child: Text("DescriptionLinksScreen".tr,style: Theme.of(context).textTheme.subtitle1,)),
                Divider( color: HexaColor.fromHexa('#878787'),height: 1,),
                SizedBox(height: 10.h,),
                Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text('paymentLinkAddress'.tr),
                      Text("ssssssss")
                    ],),
                    SizedBox(height: 18.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('invoiceValue'.tr),
                        Text("500.00د.ك")
                      ],),
                    SizedBox(height: 18.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('invoiceLinkReference'.tr),
                        Text("3004850000")
                      ],),
                    SizedBox(height: 18.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('paymentLink'.tr),
                        Text("http://jfjojjjjgjjjjjgjk[horf",style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 10.sp,fontWeight: FontWeight.w600),)
                      ],),
                    SizedBox(height: 18.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('dateCreated'.tr),
                         Text("1\12\2022")
                      ],),
                    SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('enabled'.tr),
                        Transform.scale(
                          scale: .6,
                          child: Switch.adaptive(value: logic.isSelected
                            , onChanged: (newValue) {
                            logic.changeSwitch(newValue);
                            },activeColor: Theme.of(context).primaryColor,),)
                      ],),
                  ],
                ),),
                SizedBox(height: 20.h,),
                Divider( color: HexaColor.fromHexa('#878787'),height: 1,),
                SizedBox(height: 20.h,),
                Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('notes'.tr,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.w,color: HexaColor.fromHexa('#000000'),fontWeight: FontWeight.w500,  decoration: TextDecoration.underline,),),
                    SizedBox(height: 10.sp,),
                    SizedBox(
                      child: defaultFormField(
                        maxLines: 6,
                        minLines: 6,
                        controller: null,
                        type: TextInputType.text,
                        borderRadius: 8,
                        borderColor: Colors.transparent,
                        fillColor: HexaColor.fromHexa('#F8F8F8'),
                        focusBorderRadius: 8,
                        focusColor: Colors.transparent,
                        writeTextColor: Colors.black,
                        writeFontSize: 14.sp,

                      ),
                    ),

                  ],
                ),),

              ],
            );
          }
        ),
      ),
    );
  }
}


