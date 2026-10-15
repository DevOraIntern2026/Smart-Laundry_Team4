import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';
import 'package:smart_laundry/core/widgets/custom_app_bar.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/profile_header.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/profile_indecators.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/profile_list_tile.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/profile_section.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.profile,
        icon: AppAssets.profileIcon,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 21),
                ProfileHeader(
                  image: AppAssets.profileAvatar,
                  name: "أحمد عبدالله",
                  phoneNumber: "+20 10 1234 5678",
                ),
                SizedBox(height: 16.h),
                ProfileIndecators(),
                SizedBox(height: 16.h),
                Text(AppStrings.mangeProfile),
                ProfileSection(
                  items: [
                    ProfileListTile(
                      image: AppAssets.idIcon,
                      title: AppStrings.personalInfo,
                      subTtitle: AppStrings.personalInfDesc,
                    ),
                    ProfileListTile(
                      image: AppAssets.homeLocationIcon,
                      title: AppStrings.addresses,
                      subTtitle: AppStrings.addressesDesc,
                      tralingWidget: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Text("2 عناوين"),
                      ),
                    ),
                    ProfileListTile(
                      image: AppAssets.paymentCardIcon,
                      title: AppStrings.paymentMethods,
                      subTtitle: AppStrings.paymentMethodsDesc,
                      tralingWidget: Container(
                        width: 10.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(AppStrings.prefs),
                ProfileSection(
                  items: [
                    ProfileListTile(
                      image: AppAssets.notificationBellIcon,
                      title: AppStrings.notifications,
                      subTtitle: AppStrings.notificationsDesc,
                    ),
                    ProfileListTile(
                      image: AppAssets.preferances,
                      title: AppStrings.languages,
                      subTtitle: AppStrings.languagesDesc,
                      tralingWidget: Text("العربية"),
                    ),
                  ],
                ),

                Text(AppStrings.help),
                ProfileSection(
                  items: [
                    ProfileListTile(
                      image: AppAssets.callCenter,
                      title: AppStrings.helpCenter,
                      subTtitle: AppStrings.helpCenterDesc,
                    ),
                    ProfileListTile(
                      image: AppAssets.preferances,
                      title: AppStrings.warranty,
                      subTtitle: AppStrings.warrantyDesc,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
