import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';

class AppTopBar extends StatelessWidget {
  const AppTopBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(color: AppColors.white),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            // Back arrow
            GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(
                Icons.arrow_back,
                size: 24,
                color: AppColors.darkblue,
              ),
            ),
            const SizedBox(width: 12),

            // Title
            Text(
              title,
              style: const TextStyle(
                fontFamily: AppTextStyle.fontFamily,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 24 / 18,
                color: AppColors.darkblue,
              ),
            ),

            const Spacer(),

            // Logo
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
