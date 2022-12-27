import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paymyy/routes/app_routes.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/values/assets/app_icons.dart';
import '../../../data/models/bill_model.dart';

class BillWidget extends StatelessWidget {
  const BillWidget({
    Key? key,
    required this.bill,
  }) : super(key: key);

  final BillModel bill;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
Get.toNamed(AppRoutes.detailsBill);
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(width: 0.7,color: AppColors.whitef3)
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          height: 72.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Text('#'+bill.id.toString(),style: AppTextStyles.b14.copyWith(color: AppColors.black22),),
                    Text(bill.date,style: AppTextStyles.b14.copyWith(color: AppColors.black22)),
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Text(bill.amount,style: AppTextStyles.b14.copyWith(color: AppColors.grey78),),
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.check),
                        SizedBox(width: 5.w,),
                        Text(bill.state,style: AppTextStyles.b14.copyWith(color: AppColors.black22)),
                      ],
                    ),

                  ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
