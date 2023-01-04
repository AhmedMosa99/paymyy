
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pay_myy/modules/profile/controllers/profile_controller.dart';
import 'package:pay_myy/utils/themes/light_theme.dart';

class ItemFeesWidget extends StatelessWidget {
  String ?name;
   ItemFeesWidget({
     required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (logic) {
        return Padding(
          padding:  EdgeInsets.only(top: 16.0.h,right: 16.w,left: 16.w),
          child: SizedBox(
            height: 196.h,
            child: Stack(children: [
              Container(
                height: 176.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color:HexaColor.fromHexa('#F3F3F3'), ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2.sp,
                          color:Colors.grey.shade300,
                          offset: Offset (0,2)
                      ),
                    ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      height:45.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color:Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10) )
                      ),
                      child: Text(name!,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16.sp,color: Colors.white),),
                    ),

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                      child: Text("commissionFrom".tr),
                    ),
                    SizedBox(height: 40.w,width: double.infinity,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        height: 40.h,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(children: [
                          InkWell(
                            onTap: (){
                                 logic.changeRadioCompany();
                            },
                            child: Row(
                              children: [
                                  logic.company?SvgPicture.asset('assets/images/radio_active.svg'):  SvgPicture.asset('assets/images/radio.svg'),
                                SizedBox(width: 8.w,),
                                Text("company".tr,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                          SizedBox(width: 21.w,),
                          InkWell(
                            onTap: (){
                                  logic.changeRadioCustomer();
                            },
                            child: Row(
                              children: [
                                logic.customer?SvgPicture.asset('assets/images/radio_active.svg'):  SvgPicture.asset('assets/images/radio.svg'),
                                SizedBox(width: 8.w,),
                                Text("customer".tr,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                          SizedBox(width: 21.w,),
                          InkWell(
                            onTap: (){
                                 logic.changeRadioTogether();
                            },
                            child: Row(
                              children: [
                                logic.together?SvgPicture.asset('assets/images/radio_active.svg'):  SvgPicture.asset('assets/images/radio.svg'),
                                SizedBox(width: 8.w,),
                                Text("splitWithCustomer".tr,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ],),
                      ),
                    ),

                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 135.5.w,
                        child: ElevatedButton(onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.only(topRight: Radius.circular(10),bottomRight:  Radius.circular(10)),
                                side: BorderSide(color: HexaColor.fromHexa('#878787'),width: .5.w)
                            ),
                            backgroundColor: HexaColor.fromHexa('#FFFFFF'),

                          ), child: Text("cancel".tr,style: Theme.of(context).textTheme.bodyText2,),)),
                    SizedBox(
                        width: 135.5.w,
                        child: ElevatedButton(onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft:  Radius.circular(10)),
                              ),
                            ), child: Text("activation".tr,)
                        ))
                  ],),
              )
            ],),
          ),
        );
      }
    );
  }
}