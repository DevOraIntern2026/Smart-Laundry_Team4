import 'package:flutter/material.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';

class PasswordStrengthBar extends StatelessWidget {
  const PasswordStrengthBar({super.key, required this.password});

  final String password;

  /// Number of satisfied rules (0 to 3)
  int get _score {
    var score = 0;
    if (password.length >= 8) score++;
    if (RegExp(r'[A-Z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password)) {
      score++;
    }
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>_\-]').hasMatch(password)) score++;
    return score;
  }

  String get _text {
    switch (_score) {
      case 1:
        return AppStrings.strengthWeak;
      case 2:
        return AppStrings.strengthMedium;
      case 3:
        return AppStrings.strengthStrong;
      default:
        return AppStrings.strengthEmpty;
    }
  }

  Color get _color {
    switch (_score) {
      case 1:
        return AppColors.danger;
      case 2:
        return AppColors.orange;
      case 3:
        return AppColors.emerald;
      default:
        return AppColors.primaryColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final score = _score;
    final isEmpty = score == 0;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isEmpty ? AppColors.sunsetOrange : AppColors.darkblue50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  AppStrings.passwordStrength,
                  style: TextStyle(
                    fontFamily: AppTextStyle.fontFamily,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 1.0,
                    color: AppColors.gray,
                  ),
                ),
                if (!isEmpty)
                  Text(
                    _text,
                    style: TextStyle(
                      fontFamily: AppTextStyle.fontFamily,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                      color: _color,
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 6),

            Row(
              children: List.generate(3, (i) {
                final active = i < score;
                return Expanded(
                  child: Container(
                    height: 6,
                    margin: EdgeInsetsDirectional.only(start: i == 0 ? 0 : 6),
                    decoration: BoxDecoration(
                      color: isEmpty
                          ? AppColors.strengthEmptyBar
                          : (active ? _color : AppColors.softBorderBlue),
                      borderRadius: BorderRadius.circular(9999),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
