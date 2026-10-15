import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';

class ProfileIndecators extends StatelessWidget {
  const ProfileIndecators({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      
         Expanded(
           child: _buildProfileIndecator(
            context,
            image: AppAssets.bagIcon,
            num: 8,
            title: AppStrings.completedOrders,
                     ),
         ),
        SizedBox(width: 4,),
        Expanded(
          child: _buildProfileIndecator(
            context,
            image: AppAssets.servicesIcon,
            num: 34,
            title: AppStrings.refreshedPieces,
          ),
        ),
        SizedBox(width: 4,),
          Expanded(
            child: _buildProfileIndecator(
            context,
            image: AppAssets.timeIcon,
            num: 16,
            title: AppStrings.savedHours,
                      ),
          ),
       
      ],
    );
  }

  Widget _buildProfileIndecator(
    BuildContext context, {
    required String image,
    required int num,
    required String title,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              shape: BoxShape.circle
            ),
            child: SvgPicture.asset(image,)),
          Text("$num", style: AppTextStyle.heading(context)),
          Text(
            title,
            style: AppTextStyle.mediumTitle11(
              context,
              color: AppColors.darkGray,
              
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
