import 'package:flutter/material.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';

class SignUpBanner extends StatelessWidget {
  const SignUpBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.sunsetOrange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: Image.asset(
                AppAssets.authBannerLogo,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            // Title + description
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.joinNivo,
                    style: TextStyle(
                      fontFamily: AppTextStyle.fontFamily,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                      color: AppColors.danger,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    AppStrings.joinNivoDesc,
                    style: TextStyle(
                      fontFamily: AppTextStyle.fontFamily,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                      color: AppColors.gray,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
