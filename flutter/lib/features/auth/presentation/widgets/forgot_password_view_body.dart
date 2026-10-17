import 'package:flutter/material.dart';
import '../../../../core/widgets/app_top_bar.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          AppTopBar(title: AppStrings.resetPasswordTitle),

          SizedBox(height: 16),

          _ResetIcon(),

          SizedBox(height: 12),

          Text(
            AppStrings.forgotPasswordQuestion,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: AppTextStyle.fontFamily,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 1.0,
              color: AppColors.black,
            ),
          ),

          SizedBox(height: 8),

          SizedBox(
            width: 320,
            child: Text(
              AppStrings.forgotPasswordDesc,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTextStyle.fontFamily,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 1.25,
                color: AppColors.gray,
              ),
            ),
          ),

          // Tabs, phone field, button... next
        ],
      ),
    );
  }
}

/// Big light circle > white circle with the icon + small blue badge
class _ResetIcon extends StatelessWidget {
  const _ResetIcon();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112,
      height: 112,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Outer light circle
          Container(
            width: 96,
            height: 96,
            margin: const EdgeInsets.only(top: 8, left: 8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.darkblue100,
            ),
            alignment: Alignment.center,
            // Inner white circle
            child: Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowLight,
                    offset: Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Image.asset(
                AppAssets.authResetLock,
                width: 30,
                height: 30,
              ),
            ),
          ),

          // Small blue badge (top right)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Image.asset(
                AppAssets.authBadgeLaundry,
                width: 14,
                height: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
