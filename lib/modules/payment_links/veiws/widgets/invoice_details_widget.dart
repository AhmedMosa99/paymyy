import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/component/component.dart';
import '../../../../utils/themes/light_theme.dart';

class InvoiceDetailsWidget extends StatelessWidget {
  const InvoiceDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 32.w,),
          child: Text("invoiceDetails".tr,style: Theme.of(context).textTheme.subtitle1,),
        ),
        Divider( color: HexaColor.fromHexa('#878787'),),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 10.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32.w,vertical: 16.h),
            height: 250.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: HexaColor.fromHexa('#D9D9D9')),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2.sp,
                      color:Colors.grey.shade300,
                      offset: Offset (0,2.5)
                  ),
                ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height:40.h,
                  child: defaultFormField(
                      controller: null,
                      type: TextInputType.text,
                      borderRadius: 8,
                      borderColor: Colors.transparent,
                      fillColor: HexaColor.fromHexa('#F8F8F8'),
                      focusBorderRadius: 8,
                      focusColor: Colors.transparent,
                      writeTextColor: Colors.black,
                      writeFontSize: 14.sp,
                      hintStyle: TextStyle(fontSize: 10.sp,color: HexaColor.fromHexa('#878787')),
                      hintText: "lessValue".tr

                  ),
                ),
                SizedBox(height: 16.sp,),
                SizedBox(
                  height:40.h,
                  child: defaultFormField(
                      controller: null,
                      type: TextInputType.text,
                      borderRadius: 8,
                      borderColor: Colors.transparent,
                      fillColor: HexaColor.fromHexa('#F8F8F8'),
                      focusBorderRadius: 8,
                      focusColor: Colors.transparent,
                      writeTextColor: Colors.black,
                      writeFontSize: 14.sp,
                      hintStyle: TextStyle(fontSize: 10.sp,color: HexaColor.fromHexa('#878787')),
                      hintText: "highestValue".tr
                  ),
                ),
                SizedBox(height: 16.sp,),
                Text('notes'.tr,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.w,color: HexaColor.fromHexa('#000000'),fontWeight: FontWeight.w500,  decoration: TextDecoration.underline,),)
                ,
                SizedBox(height: 10.sp,),
                SizedBox(
                  height:73.h,
                  child: defaultFormField(
                    maxLines: 4,
                    minLines: 3,
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

              ],),

          ),
        ),
      ],
    );
  }
}
