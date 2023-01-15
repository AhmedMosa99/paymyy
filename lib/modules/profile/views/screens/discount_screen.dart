import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../widgets/item_dicount_widgets.dart';

class DiscountScreen extends StatelessWidget {
  const DiscountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("discount".tr,style:TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700),),      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return InkWell(onTap: () {}, child: ItemDiscountWidget());
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 16.h,
            );
          },
          itemCount: 3,
        ),
      ),
    );
  }
}
