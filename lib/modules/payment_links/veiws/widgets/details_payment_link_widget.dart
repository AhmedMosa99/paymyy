
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pay_myy/modules/payment_links/controllers/payment_link_controller.dart';

import '../../../../utils/component/component.dart';
import '../../../../utils/themes/light_theme.dart';

class PaymentLinkDetailsWidget extends StatelessWidget {
  const PaymentLinkDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GetBuilder<PaymentLinkController>(
      builder: (logic) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 10.h),child: Text("DescriptionLinksScreen".tr,style: Theme.of(context).textTheme.subtitle1,)),
            Divider( color: HexaColor.fromHexa('#878787'),),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 10.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w,vertical: 16.h),
                height: 230.h,
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
                child: Column(children: [
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
                        hintStyle: Theme.of(context).textTheme.subtitle2,
                        hintText: "PaymentLinksAddress".tr
                    ),
                  ),
                  SizedBox(height: 16.sp,),
                  SizedBox(height: 40.w,width: double.infinity,
                    child: Row(children: [
                      Container(
                        width:46.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: HexaColor.fromHexa('#D9D9D9'),
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight:  Radius.circular(10)),
                        ),
                        child: Center(child: Text("د.ك",style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600),)),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          height: 40.h,
                          decoration: BoxDecoration(
                              color: HexaColor.fromHexa('#F8F8F8'),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft:  Radius.circular(10))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("invoiceValue".tr,style: Theme.of(context).textTheme.subtitle2,),
                              Icon(Icons.keyboard_arrow_down_sharp,size: 20.w,)
                            ],),
                        ),
                      )
                    ],),
                  ),
                  SizedBox(height: 16.sp,),
                  Row(children: [
                    SizedBox(width: 15.w,),
                    SvgPicture.asset('assets/images/lang.svg',width: 24.w,height: 24.h,),
                    SizedBox(width: 13.w,),
                    Text('language'.tr,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.w,color: HexaColor.fromHexa('#000000'),fontWeight: FontWeight.w500,  decoration: TextDecoration.underline,),)
                  ],),
                  SizedBox(height: 16.sp,),
                  SizedBox(height: 40.w,width: double.infinity,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: HexaColor.fromHexa('#F8F8F8'),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(children: [
                        InkWell(
                          onTap: (){
                            logic.changeRadioEnglish();
                          },
                          child: Row(
                            children: [
                            logic.isEnglish?SvgPicture.asset('assets/images/radio_active.svg'):  SvgPicture.asset('assets/images/radio.svg'),
                              SizedBox(width: 8.w,),
                              Text("english".tr,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 10.sp)),
                            ],
                          ),
                        ),
                        SizedBox(width: 21.w,),
                        InkWell(
                          onTap: (){
                            logic.changeRadioArabic();
                          },
                          child: Row(
                            children: [
                              logic.isArabic?SvgPicture.asset('assets/images/radio_active.svg'): SvgPicture.asset('assets/images/radio.svg'),
                              SizedBox(width: 8.w,),
                              Text("arabic".tr,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 10.sp),),
                            ],
                          ),
                        ),
                      ],),
                    ),
                  ),

                ],),

              ),
            ),
          ],
        );
      }
    );
  }
}
