import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(
                Icons.arrow_back,
                size: 24,
                color: AppColors.darkblue,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              AppStrings.signUpTitle,
              style: TextStyle(
                fontFamily: AppTextStyle.fontFamily,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 24 / 18,
                color: AppColors.darkblue,
              ),
            ),
            const Spacer(),
            Image.asset(
              AppAssets.welcomeLogo,
              width: 52,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
