import 'package:flutter/material.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';

/// Labeled text field used across the app (label + optional trailing text + input)
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.isRequired = false,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.trailingLabel,
    this.height = 45,
    this.isWhite = false,
    this.onChanged,
  });

  final String label;
  final String hint;
  final ValueChanged<String>? onChanged;

  final bool isWhite;
  final TextEditingController? controller;
  final bool isRequired;

  /// Shown on the right side (first child in RTL)
  final Widget? suffixIcon;

  /// Shown on the left side (last child in RTL)
  final Widget? prefixIcon;

  final bool obscureText;
  final TextInputType? keyboardType;

  /// Small text on the left end of the label row (e.g. AppStrings.requiredLabel)
  final String? trailingLabel;

  /// Input height (Figma: 45 on login, 41 on sign up)
  final double height;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontFamily: AppTextStyle.fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.0,
                        color: AppColors.black,
                      ),
                    ),
                    if (isRequired) ...[
                      const SizedBox(width: 6),
                      const Text(
                        AppStrings.requiredMark,
                        style: TextStyle(
                          fontFamily: AppTextStyle.fontFamily,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 1.0,
                          color: AppColors.danger,
                        ),
                      ),
                    ],
                  ],
                ),
                if (trailingLabel != null)
                  Text(
                    trailingLabel!,
                    style: const TextStyle(
                      fontFamily: AppTextStyle.fontFamily,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                      color: AppColors.gray,
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(height: 6),

          // Input: Fill x height, radius 12, #F9FBFF
          Container(
            width: double.infinity,
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: isWhite ? AppColors.white : AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: isWhite
                  ? const [
                      BoxShadow(
                        color: AppColors.shadowLight, // #000000 at 5%
                        offset: Offset(0, 1),
                        blurRadius: 2,
                      ),
                    ]
                  : null,
            ),
            child: Row(
              children: [
                if (suffixIcon != null) ...[
                  suffixIcon!,
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: TextField(
                    controller: controller,
                    obscureText: obscureText,
                    keyboardType: keyboardType,
                    onChanged: onChanged,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontFamily: AppTextStyle.fontFamily,
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: hint,
                      hintStyle: const TextStyle(
                        fontFamily: AppTextStyle.fontFamily,
                        fontSize: 14,
                        color: AppColors.hintBlue,
                      ),
                    ),
                  ),
                ),
                if (prefixIcon != null) ...[
                  const SizedBox(width: 8),
                  prefixIcon!,
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
