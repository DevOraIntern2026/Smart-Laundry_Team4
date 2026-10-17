import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/profile_list_tile.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key, required this.items});

 final List<ProfileListTile> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white, 
        borderRadius: BorderRadius.circular(12.r)
      ),
      child: Column(
        children: items,
      ),
    );
  }
}