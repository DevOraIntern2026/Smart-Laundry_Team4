import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.image, required this.name, required this.phoneNumber});

  final String image;
  final String name;
  final String phoneNumber;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundImage: AssetImage(AppAssets.profileAvatar),
            ),
            SizedBox(width: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextStyle.heading(context),),
                Text(phoneNumber, style: AppTextStyle.mediumTitle16(context), textDirection: TextDirection.ltr,),
    
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: AppColors.sunsetOrange,
                    borderRadius: BorderRadius.circular(30.r)
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppAssets.star, width: 14.w, height: 14.w,),
                      SizedBox(width: 6.w,),
                      Text(" عضو مميز VIP", style: AppTextStyle.heading(context),)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
    
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.lightGray
          ),
          child: Icon(Icons.edit_outlined),
        )
      ],
    );
  }
}