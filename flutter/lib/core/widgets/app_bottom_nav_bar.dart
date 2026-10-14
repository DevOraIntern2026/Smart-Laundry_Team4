import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';

class AppBottomNavBar extends StatelessWidget {
  final ValueChanged<int>? onTap;
  final int currentIndex;
  const AppBottomNavBar({super.key, this.onTap, this.currentIndex = 1});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      currentIndex: currentIndex,
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
          icon: Image.asset(AppAssets.servicesIcon),
          label: AppStrings.services,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(AppAssets.aiAssistantIcon),
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
    );
  }
}
