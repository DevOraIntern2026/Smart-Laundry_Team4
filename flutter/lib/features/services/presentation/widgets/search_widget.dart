import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController? controller;
  const SearchWidget({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Container(
        width: 350.w,
        height: 48.h,

        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.gray.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: AppColors.gray, size: 22.sp),
            SizedBox(width: 8.w),
            Expanded(
              child: TextField(
                maxLines: 1,
                controller: controller,
                style: AppTextStyle.mediumTitle13(
                  context,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray,
                ),
                decoration: InputDecoration(
                  hintText: AppStrings.search,
                  hintStyle: AppTextStyle.mediumTitle13(
                    context,
                    fontWeight: FontWeight.w400,
                  ),

                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
