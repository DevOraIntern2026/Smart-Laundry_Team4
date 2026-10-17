import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';
import 'package:smart_laundry/core/widgets/app_card.dart';
import 'package:smart_laundry/core/widgets/circle_icon_button.dart';

class CourierCard extends StatelessWidget {
  const CourierCard({
    super.key,
    required this.name,
    required this.rating,
    required this.reviewsCount,
    required this.onMessage,
    required this.onCall,
    this.avatarAsset = AppAssets.profileAvatar,
  });

  final String name;
  final double rating;
  final int reviewsCount;
  final String avatarAsset;
  final VoidCallback onMessage;
  final VoidCallback onCall;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          CircleAvatar(
            radius: 24.r,
            backgroundColor: AppColors.border,
            backgroundImage: AssetImage(avatarAsset),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyle.f14w400(
                    context,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Icon(Icons.star, size: 14.w, color: Colors.amber),
                    SizedBox(width: 3.w),
                    Text(
                      '$rating ($reviewsCount تقييم)',
                      style: AppTextStyle.mediumTitle11(
                        context,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CircleIconButton(
            icon: Icons.chat_bubble_outline,
            color: AppColors.primaryColor,
            onTap: onMessage,
          ),
          SizedBox(width: 8.w),
          CircleIconButton(
            icon: Icons.phone_outlined,
            color: AppColors.darkblue600,
            onTap: onCall,
          ),
        ],
      ),
    );
  }
}
