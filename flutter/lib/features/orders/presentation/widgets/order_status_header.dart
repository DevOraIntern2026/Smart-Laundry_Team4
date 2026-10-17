import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';

class OrderStatusHeader extends StatelessWidget {
  const OrderStatusHeader({
    super.key,
    required this.orderId,
    required this.time,
    required this.itemsCount,
    required this.status,
    required this.eta,
  });

  final String orderId;
  final String time;
  final int itemsCount;
  final String status;
  final String eta;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(AppStrings.orderCode),
                  SizedBox(width: 4.w,),
                  Text(
                    orderId,
                    style: AppTextStyle.f18w700(context),
                  ),
                ],
              ),
              Text(
                time,
                style: AppTextStyle.f12w500(context),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppAssets.smart, color: AppColors.darkblue600, width: 12.w, height:  15.h,),
                  SizedBox(width: 6.w,),
                  Text("غسيل و كوي عادي + مفروشات"),
                ],
              ),
              Text(
                AppStrings.piecesCount(itemsCount),
                style: AppTextStyle.f12w500(context),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.darkblue600,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status,
                  style: AppTextStyle.f14w400(
                    context,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  eta,
                  style: AppTextStyle.f12w500(context, color: AppColors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
