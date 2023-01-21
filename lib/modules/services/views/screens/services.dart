
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paymyy/core/theme/app_colors.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:SizedBox(height: 40.h,width: 271,child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8))),
        onPressed: (){},child:Row(children: [
        CircleAvatar(
          radius: 16.w,
          backgroundColor:Colors.white ,child: Icon(Icons.add,size: 30.w,color: AppColors.primary,),),
        SizedBox(width: 23.w,),
        Text('اسحب لطلب الخدمة',style: TextStyle(fontSize: 15.sp,fontWeight: GoogleFonts.tajawal().fontWeight),),
      ],),),) ,
      appBar: AppBar(
        title: Text('بطاقات الدفع المحلي',style: TextStyle(fontSize: 20.sp,color:Colors.black, fontWeight: FontWeight.w700),),
        elevation: 0,
      ),
      body: SafeArea(child: 
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/test.png',height: 490.h,),
              SizedBox(height: 30.h,),
              Text("""بوابة الدفع
عندك موقع او تطبيق ؟ تبي تطور شغلك ويصير أونلاين ؟
سهل على عملاءك الدفع من موقعك ووفرلهم طرق الدفع المحلية
 والعالمية ، اربط موقعك او تطبيقك مع paymyy واستقبل أول عملية 
دفع خلال اقل 24 ساعة عمل
نزودك أيضاً بالشحن المباشر مع DHL """,style: TextStyle(fontSize: 12.sp,color: Colors.black),)
            ],
          ),
        )
        ,),
    );
  }
}
