
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paymyy/core/theme/app_colors.dart';

import '../../../home/controllers/home_controller.dart';

class ServicesScreen extends StatelessWidget {
  int ?id ;
  String? name;
  String ?description;
  String ? logo;
  bool?assigned;


   ServicesScreen({Key? key,this.name,this.logo,this.description,this.id,this.assigned}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:assigned!?Container():SizedBox(height: 40.h,width: 271,child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8))),
        onPressed: (){
          Get.put((HomeController()).requestServices(id));
        },child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        CircleAvatar(
          radius: 16.w,
          backgroundColor:Colors.white ,child: Icon(Icons.add,size: 30.w,color: AppColors.primary,),),
        SizedBox(width: 23.w,),
        Text(' اطلب  الخدمة',style: TextStyle(fontSize: 15.sp,fontWeight: GoogleFonts.tajawal().fontWeight),),
      ],),),) ,
      appBar: AppBar(
        title: Text(name!,style: TextStyle(fontSize: 20.sp,color:Colors.black, fontWeight: FontWeight.w700),),
        elevation: 0,
      ),
      body: SafeArea(child: 
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(logo!,height: 490.h,),
                SizedBox(height: 30.h,),
              Html(data: description,),
                SizedBox(height: 30.h,),
              ],
            ),
          ),
        )
        ,),
    );
  }
}
