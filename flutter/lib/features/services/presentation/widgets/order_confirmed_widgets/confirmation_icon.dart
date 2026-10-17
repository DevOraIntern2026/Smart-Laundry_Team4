import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';

class ConfirmationIcon extends StatelessWidget {
  const ConfirmationIcon({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: AppColors.darkblue100,
            shape: BoxShape.circle
          ),
          child: Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(
                color: AppColors.darkblue600.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 0)
              )]
        
            ),
            child: Icon(Icons.check, color: AppColors.darkblue600, size: 30,),
          ),
        ),
        Positioned(
          top: -5.h,
          right: -5.w,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: AppColors.darkblue600,
                shape: BoxShape.circle
              ),
              child: SvgPicture.asset(AppAssets.smart),
                    ),
          ))
      ],
    );
  }
}