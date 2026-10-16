import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("المسار الزمني المباشر", style: AppTextStyle.f12w500(context, color: AppColors.white500),),
              Text("قيد الجدولة", style: AppTextStyle.f12w700(context,color: AppColors.darkblue600),),
            ],
          ),
          SizedBox(height: 12.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIconCircle(icon: Icons.check, isActive: true),
              _buildIconCircle(icon: Icons.local_shipping_outlined),
              _buildIconCircle(icon: Icons.water_drop_outlined),
              _buildIconCircle(icon: Icons.home_outlined),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildIconCircle({ required IconData icon ,bool isActive = false}){
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: isActive? AppColors.darkblue600: AppColors.darkblue50,
        shape: BoxShape.circle
      ),
      child: Icon(icon, color: isActive? AppColors.white: AppColors.white500,),
    );
  }
}