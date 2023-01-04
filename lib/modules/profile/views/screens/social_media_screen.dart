import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pay_myy/utils/themes/light_theme.dart';
import '../../../../utils/component/component.dart';
import '../widgets/item_social_widget.dart';
class SocialMediaScreen extends StatelessWidget {
  const SocialMediaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(
          context: context,
          builder: (BuildContext context) {

            return AlertDialog(
              content:  Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: 120.h,
                width: 337.w,
                child: Column(
                  children: [
                   SizedBox(height: 20,),
                    Row(children: [
                      Text("choose".tr,style: Theme.of(context).textTheme.bodyText1,),
                      SizedBox(width: 16.w,),
                      Container(
                        padding: EdgeInsets.all(5),
                        height: 29.h
                        ,width: 95.w,
                        decoration: BoxDecoration(color: HexaColor.fromHexa('#F8F8F8'),borderRadius: BorderRadius.circular(10))
                        ,child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("انستغرام",style: Theme.of(context).textTheme.subtitle2!.copyWith(color:Colors.black ),),
                        Icon(Icons.keyboard_arrow_down,size: 16.w,)
                      ],)
                        ,)
                    ],),
                    SizedBox(height: 16,),
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

                  ],
                ),
              ),
            );
          },
        );
      },child: Icon(Icons.add,size: 30.w,color: Colors.white,),),
      appBar: AppBar(
        elevation: 0,
        title: Text("socialMedia".tr),
        leading: Icon(Icons.arrow_back_ios,size: 21.sp,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return  InkWell(
                onTap: (){
                },
                child: ItemSocialItemWidget());
          }, separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 16.h,);
        }, itemCount: 3,
        ),
      ),
    );
  }
}


