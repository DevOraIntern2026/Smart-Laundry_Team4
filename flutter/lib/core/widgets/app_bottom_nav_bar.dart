import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';

class AppBottomNavBar extends StatefulWidget {
  final ValueChanged<int>? onTap;
  int currentIndex;
  
  AppBottomNavBar({super.key, this.onTap, this.currentIndex = 0});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: widget.onTap,
        currentIndex: widget.currentIndex,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.secondaryColor,
        unselectedItemColor: AppColors.gray,
        selectedLabelStyle: AppTextStyle.mediumTitle11(context),
        unselectedLabelStyle: AppTextStyle.mediumTitle11(
          context,
          fontWeight: FontWeight.w500,
        ),
      
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.servicesIcon),
            activeIcon: SvgPicture.asset(AppAssets.servicesIcon, color: AppColors.secondaryColor,),
            label: AppStrings.services,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.aiAssistantIcon,),
            activeIcon: SvgPicture.asset(AppAssets.aiAssistantIcon, color: AppColors.secondaryColor,),
            label: AppStrings.aiAssistant,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: AppStrings.orders,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 16.w),
            label: AppStrings.profile,
          ),
        ],
      ),
    );
  }
}
