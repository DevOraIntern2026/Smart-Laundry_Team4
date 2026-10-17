import 'package:flutter/material.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Logo
        Image.asset(
          AppAssets.welcomeLogo,
          width: 118,
          fit: BoxFit.contain,
        ),

        // Smart Care Badge
        Container(
          padding: const EdgeInsets.only(
            top: 4,
            bottom: 4,
            left: 12,
            right: 12,
          ),
          decoration: BoxDecoration(
            color: AppColors.darkblue50,
            borderRadius: BorderRadius.circular(9999),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.loginBadge,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryColor,
                  fontFamily: AppTextStyle.fontFamily,
                ),
              ),

              SizedBox(width: 6),
              Image.asset(
                AppAssets.authBadgeLaundry,
                width: 14,
                height: 14,
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        const Text(
          AppStrings.welcomeBack,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppTextStyle.fontFamily,
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
            height: 1.0,
          ),
        ),

        const SizedBox(height: 5),

        // Subtitle
        const Text(
          AppStrings.loginSubtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppTextStyle.fontFamily,
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: AppColors.gray,
            height: 1.4,
          ),
        ),

        const SizedBox(height: 28),
      ],
    );
  }
}
