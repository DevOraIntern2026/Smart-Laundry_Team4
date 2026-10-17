import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';

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
                Text("إرشاد سريع ومريح", style: AppTextStyle.f12w700(context)),
                Text(
                  "يرجى وضع الملابس في أي كيس متاح لديك؛ سيقوم مندوب نيفو بوضع بطاقة تعريف ذكية مخصصة لكل قطعة وفرزها بأمان أمامك.",
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
