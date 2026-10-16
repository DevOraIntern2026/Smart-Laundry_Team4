import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key, required this.text, required this.icons, required this.onPressed});

  final String text;
  final String icons;
  final void Function() onPressed;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      
      child: ElevatedButton(
        
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        backgroundColor: AppColors.sunsetOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12.r)
        )
      ),  
      onPressed: onPressed,
       child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
           SvgPicture.asset(AppAssets.logout),
           SizedBox(width: 6,),
           Text(
            text,
            style: AppTextStyle.mediumTitle16(context, color: AppColors.red),
           ),
         ],
       ),),
    );
  }
}