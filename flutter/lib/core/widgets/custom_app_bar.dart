import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, required this.icon});

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
          elevation: 0,
          titleSpacing: 5,
          actionsPadding: EdgeInsets.only(left: 15),
          backgroundColor: AppColors.white,
          title: Text(
            title,
            style: AppTextStyle.heading(context),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 7, bottom: 7),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: SvgPicture.asset(icon, width: 17.w, height: 16.h, color: AppColors.secondaryColor,),
            ),
          ),
          actions: [
            Icon(Icons.notifications_outlined, color: AppColors.gray),
            SizedBox(width: 10.w),
            Image.asset(AppAssets.welcomeLogo, width: 52.w),
          ],
        );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}