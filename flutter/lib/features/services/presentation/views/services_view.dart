import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';
import 'package:smart_laundry/core/widgets/app_bottom_nav_bar.dart';
import 'package:smart_laundry/features/services/presentation/widgets/search_widget.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        bottomNavigationBar: AppBottomNavBar(),
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 5,
          actionsPadding: EdgeInsets.only(left: 15),
          backgroundColor: AppColors.white,
          title: Text(
            AppStrings.services,
            style: AppTextStyle.heading(context),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 7, bottom: 7),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(AppAssets.servicesIcon, width: 17.w),
            ),
          ),
          actions: [
            Icon(Icons.notifications_outlined, color: AppColors.gray),
            SizedBox(width: 10.w),
            Image.asset(AppAssets.welcomeLogo, width: 52.w),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [SearchWidget()]),
          ),
        ),
      ),
    );
  }
}
