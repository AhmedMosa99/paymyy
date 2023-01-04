import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/themes/light_theme.dart';
class LinksItemWidget extends StatelessWidget {
  const LinksItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 72.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: HexaColor.fromHexa('#D9D9D9')),
          boxShadow: [
            BoxShadow(
                blurRadius: 2.sp,
                color:Colors.grey.shade300,
                offset: Offset (0,2)
            ),
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("ssssssss",style: Theme.of(context).textTheme.bodyText1,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/move.svg',width: 20.w,height: 17.h,),
              SizedBox(width: 13.w,),
              SizedBox(
                  height: 10.h,
                  child: Text('4',style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 12.sp,color: HexaColor.fromHexa('#878787')),)),
              SizedBox(width: 13.w,),
              SvgPicture.asset('assets/images/eye.svg',width: 17.w,height: 12.h,),
            ],)

        ],
      ),
    );
  }
}