import 'package:flutter/material.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.phoneNumber,
                  style: TextStyle(
                    fontFamily: AppTextStyle.fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  AppStrings.phoneConfirmAppointments,
                  style: TextStyle(
                    fontFamily: AppTextStyle.fontFamily,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                    color: AppColors.danger,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),

          Container(
            height: 40,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadowLight,
                  offset: Offset(0, 1),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 12, 14, 12),
                  color: AppColors.darkblue50,
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(AppStrings.countryFlagEg, style: TextStyle(fontSize: 14)),
                      SizedBox(width: 6),
                      Text(
                        AppStrings.countryCodeEg,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontFamily: AppTextStyle.fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 1.0,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 16,
                        color: AppColors.gray,
                      ),
                    ],
                  ),
                ),

                // Number input
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.phone,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontFamily: AppTextStyle.fontFamily,
                        fontSize: 15,
                        color: AppColors.black,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        isDense: true,
                        hintText: AppStrings.phoneHint,
                        hintStyle: TextStyle(
                          fontFamily: AppTextStyle.fontFamily,
                          fontSize: 14,
                          color: AppColors.hintGrey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
