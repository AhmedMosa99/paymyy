import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymyy/modules/profile/views/widgets/item_social_widget.dart';
import 'package:paymyy/modules/profile/views/widgets/notifaction_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("notifications".tr,style:TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700),),      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return InkWell(onTap: () {}, child: ItemNotification());
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 16.h,
            );
          },
          itemCount: 20,
        ),
      ),
    );
  }
}
