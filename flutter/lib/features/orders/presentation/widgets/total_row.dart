import 'package:flutter/material.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';

class TotalRow extends StatelessWidget {
  const TotalRow({super.key, required this.label, required this.total});

  final String label;
  final num total;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyle.f12w500(context, color: AppColors.white500),
        ),
        Text(
          AppStrings.priceEgp(total),
          style: AppTextStyle.f20w700(context, color: AppColors.darkblue600),
        ),
      ],
    );
  }
}
