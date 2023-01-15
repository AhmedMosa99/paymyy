import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/modules/profile/views/widgets/fees_widgets.dart';

import '../widgets/Item_settings_notifcation_widget.dart';
class  TermScreen extends StatelessWidget {
  const TermScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          elevation: 0,
          title: Text("termsAndConditions".tr,style:TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),),
        ),
        body:SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Text("""الشروط والاحكام :
            تمثل الشروط والاحكام المذكورة ادناه العقد المبرم بين مستخدمي
            خدماتpaymyy( المستخدم، التاجر، البائع، المنظمة، الشخص، انت،
            او ما تمثله) وشركة paymyy.
          الشروط العامة :


          يمكن فقط للشركات، والمؤسسات، والأشخاص، والمنظمات
          المسموح لهم اجراء عمليات دفع واستلام اموال داخل بلادهم من
          قبل الجهات الرسمية، التقدم بطلب لاستخدام خدمات paymyy.
          ولا يجوز استخدام خدمات ماي فاتورة من قبل من لا يسمح لهم
          باستلام الأموال أو القيام بعمليات مالية تجارية أو غير تجارية داخل
          بلادهم.
          المبالغ المحولة بواسطة ماي فاتورة لابد ان تخدم نفس الغرض
              المذكور في استمارة التقدم للخدمة وتتوافق مع الانشطة ا
              الاسم التجاري الموضح في الفاتورة لابد ان يمثل التاجر وانشطته
              المصرح بها.
          التجار دون 16 عام لابد ان يتم تمثيلهم من خلال الوصي القانوني
          طبقا لقوانين البلاد المعمول بها.
          يوافق الكيان او الشخص المتقدم لطلب الخدمة على أن paymyy
          قد تطلب معلومات اضافية او تحديث للبيانات التي تم توفيرها
          وذلك في أي وقت. أمثلة على المعلومات والبيانات التي قد يتم
          طلبها تشمل على سبيل المثال لا الحصر اثبات الهوية، وسياسات
          واجراءات العمل، ومعلومات مالية، وتراخيص، وفواتير، ووصولات
          تسليم او أي معلومات أخرى. الاخفاق في توفير المعلومات
          المطلوبة قد ينتج عنه انقطاع الخدمة او الغاء التعاقد."),"""
          ),
          ),
        ),
    );
  }
}