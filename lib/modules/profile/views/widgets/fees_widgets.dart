import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import '../../controllers/profile_controller.dart';

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
                      border: Border.all(color:Color(0xffF3F3F3)),
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
                        child: Text("commissionFrom".tr,style: TextStyle(fontSize: 16.sp,color: Color(0xff000000), fontFamily: GoogleFonts.tajawal().fontFamily ,),),
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
                                logic.onChangeRadio('company');
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 10.w,
                                    height: 10.h,
                                    margin: EdgeInsetsDirectional.only(start: 16.w, end: 8.w),
                                    child: Radio(
                                      visualDensity: const VisualDensity(
                                        horizontal: VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      activeColor: AppColors.primary,
                                      groupValue:logic.group,
                                      value:  "company",
                                      onChanged: (x) {
                                        logic.onChangeRadio(x!);
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 4.w,),
                                  Text("company".tr,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                            SizedBox(width: 21.w,),
                            InkWell(
                              onTap: (){
                                logic.onChangeRadio('customer');
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 10.w,
                                    height: 10.h,
                                    margin: EdgeInsetsDirectional.only(start: 16.w, end: 8.w),
                                    child: Radio(
                                      visualDensity: const VisualDensity(
                                        horizontal: VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      activeColor: AppColors.primary,
                                      groupValue:logic.group,
                                      value:  "customer",
                                      onChanged: (x) {
                                        logic.onChangeRadio(x!);
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 4.w,),
                                  Text("customer".tr,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                            SizedBox(width: 21.w,),
                            InkWell(
                              onTap: (){
                                logic.onChangeRadio('splitWithCustomer');
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 10.w,
                                    height: 10.h,
                                    margin: EdgeInsetsDirectional.only(start: 16.w, end: 8.w),
                                    child: Radio(
                                      visualDensity: const VisualDensity(
                                        horizontal: VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      activeColor: AppColors.primary,
                                      groupValue: logic.group,
                                      value: "splitWithCustomer",
                                      onChanged: (x) {
                                        logic.onChangeRadio(x!);
                                      },
                                    ),
                                  ),
                                  SizedBox(width:4.w,),
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
                                  side: BorderSide(color: Color(0xff878787),width: .5.w)
                              ),
                              backgroundColor: Color(0xffFFFFFF),

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