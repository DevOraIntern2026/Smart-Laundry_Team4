import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';
import 'package:smart_laundry/features/services/presentation/widgets/order_confirmed_widgets/guidance.dart';

class AddressAppointmentDetails extends StatelessWidget {
  const AddressAppointmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.darkblue100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppAssets.locationArrow),
                  SizedBox(width: 8.w),
                  Text(
                    "عنوان الاستلام",
                    style: AppTextStyle.f12w500(
                      context,
                      color: AppColors.white500,
                    ),
                  ),
                ],
              ),
              Text("المعادي , القاهرة", style: AppTextStyle.f12w700(context, color: AppColors.white800),)
            ],
          ),
          SizedBox(height: 12.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppAssets.cash),
                  SizedBox(width: 8.w),
                  Text(
                    "إجمالي الفاتورة",
                    style: AppTextStyle.f12w500(
                      context,
                      color: AppColors.white500,
                    ),
                  ),
                ],
              ),
              Column(
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("110.70 جم", style: AppTextStyle.f12w700(context, color: AppColors.darkblue600),),
                  Text("الدفع عند الاستلام"),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
