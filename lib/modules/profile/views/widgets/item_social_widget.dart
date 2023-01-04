import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/themes/light_theme.dart';
class ItemSocialItemWidget extends StatelessWidget {
  const ItemSocialItemWidget({
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
          Row(
            children: [
              Image.asset('assets/images/instagram.png',width: 27.w,height: 27.h,fit: BoxFit.fill,),
              SizedBox(width: 15.w,),
              Text("Sara_khaled2022",style: Theme.of(context).textTheme.bodyText1!,),
            ],
          ),
          SvgPicture.asset('assets/images/remove.svg',width: 16.w,height: 16.h,fit: BoxFit.fill,)



        ],
      ),
    );
  }
}