import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paymyy/core/theme/app_colors.dart';
import 'package:paymyy/core/theme/input_validations.dart';
import 'package:paymyy/core/values/assets/app_icons.dart';
import 'package:paymyy/core/values/assets/app_images.dart';
import '../../../../core/component/component.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          title: Text("support".tr,style:TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700),),
        ),
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 22.0.h,horizontal:16.w ),
              child: Text("toSubmitALetter".tr,style: TextStyle(color: AppColors.primary,fontSize: 14.sp,fontWeight: FontWeight.w700),),
            ),
            Padding(
              padding:  EdgeInsets.only(top:0,right: 16.w,left: 16.w),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 24.h,horizontal: 32.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Color(0xffD9D9D9)),
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
                      height: 60.h,
                      child: defaultFormField(
                          type: TextInputType.emailAddress,
                          validate: (value) => InputValidations.validateName(value),
                          controller: null,
                          hintText: 'Sara Mohammed Al Khaled',
                          prefix: Image.asset(AppImages.name,color: Colors.black,),
                          hintStyle: TextStyle(fontSize: 12.sp,fontFamily: GoogleFonts.tajawal().fontFamily,color: Colors.black,fontWeight: FontWeight.w600),
                          fillColor: Color(0xffF8F8F8),
                          borderColor: Colors.transparent,
                          focusColor: Colors.transparent
                      ),
                    ),
                    SizedBox(
                      height: 60.h,
                      child: defaultFormField(
                          type: TextInputType.emailAddress,
                          validate: (value) => InputValidations.validateEmail(value),
                          controller: null,
                          hintText: 'example@gmail.com',
                          hintStyle: TextStyle(fontSize: 12.sp,fontFamily: GoogleFonts.tajawal().fontFamily,color: Colors.black,fontWeight: FontWeight.w600),
                          prefix: Icon(Icons.email_outlined,color: Colors.black,),
                          fillColor: Color(0xffF8F8F8),
                          borderColor: Colors.transparent,
                          focusColor: Colors.transparent
                      ),
                    ),
                    SizedBox(
                      height: 40.w,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            width: 80.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: Color(0xffD9D9D9),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10.w,),
                                    SvgPicture.asset(AppIcons.call,width: 12.w,height: 12.h,fit: BoxFit.fill,),
                                    SizedBox(width: 10.w,),
                                    Text(
                                      "965+",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(fontWeight: FontWeight.bold,fontSize: 10.sp),
                                    ),

                                    Icon(Icons.keyboard_arrow_down_rounded,size: 20.w,)
                                  ],
                                )),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              height: 40.h,
                              decoration: BoxDecoration(
                                  color: Color(0xffF8F8F8),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10))),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintStyle: TextStyle(fontSize: 16.sp,fontFamily: GoogleFonts.tajawal().fontFamily,color: Colors.black,fontWeight: FontWeight.w600),
                                  hintText: "555194523",
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h,),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0.h,horizontal: 9.w),
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(color:Color(0xffF8F8F8),borderRadius: BorderRadius.circular(8), ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('استفسار / طلب خدمات',style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w600),),
                          Center(child: Icon(Icons.keyboard_arrow_down)),
                        ],),
                    ),
                    SizedBox(height: 16.h,),
                    SizedBox(
                      height: 100.h,
                      child: defaultFormField(
                          type: TextInputType.emailAddress,
                          validate: (value) => InputValidations.validateName(value),
                          controller: null,
                          minLines: 5,
                          maxLines: 5,
                          prefix: Padding(
                            padding:  EdgeInsets.only(top:10.0,right: 16.w,),
                            child: SizedBox(
                              width: 30.w,
                              height: 100.h,
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(Icons.message,color: Colors.black,)),
                            ),
                          ),
                          hintText: 'massage'.tr,
                          hintStyle: TextStyle(fontSize: 12.sp,color: Colors.black,fontWeight: FontWeight.w500,fontFamily: GoogleFonts.tajawal().fontFamily),
                          fillColor: Color(0xffF8F8F8),
                          borderColor: Colors.transparent,
                          focusColor: Colors.transparent
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



}
