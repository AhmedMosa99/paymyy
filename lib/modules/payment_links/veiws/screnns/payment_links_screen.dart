import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pay_myy/services/routes/route_name.dart';
import '../widgets/links_item_widget.dart';
class PaymentLinkScreen extends StatelessWidget {
  const PaymentLinkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(RoutesName.addLinksScreen);
      },child: Icon(Icons.add,size: 30.w,color: Colors.white,),),
      appBar: AppBar(
        elevation: 0,
        title: Text("paymentLink".tr),
        leading: Icon(Icons.arrow_back_ios,size: 21.sp,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
          return  InkWell(
              onTap: (){
                Get.toNamed(RoutesName.descriptionLinksScreen);
              },
              child: LinksItemWidget());
        }, separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 16.h,);
        }, itemCount: 3,
        ),
      ),
    );
  }
}


