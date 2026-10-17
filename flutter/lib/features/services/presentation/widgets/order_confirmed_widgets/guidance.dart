import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';

class Guidance extends StatelessWidget {
  const Guidance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.darkblue100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _iconBox(),
          SizedBox(width: 10.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.quickGuideTitle, style: AppTextStyle.f12w700(context)),
                Text(
                  AppStrings.quickGuideDesc,
                  style: AppTextStyle.f12w500(context),
                  maxLines: 5,
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconBox() {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.darkblue600,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Icon(Icons.qr_code, color: AppColors.white),
    );
  }
}
