import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_laundry/core/routing/app_routes.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';
import 'package:smart_laundry/core/widgets/custom_app_bar.dart';
import 'package:smart_laundry/core/widgets/primary_button.dart';
import 'package:smart_laundry/features/services/presentation/widgets/order_confirmed_widgets/appointment_time.dart';
import 'package:smart_laundry/features/services/presentation/widgets/order_confirmed_widgets/confirmation_header.dart';
import 'package:smart_laundry/features/services/presentation/widgets/order_confirmed_widgets/guidance.dart';
import 'package:smart_laundry/features/services/presentation/widgets/order_confirmed_widgets/time_line.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';

class OrderConfirmed extends StatelessWidget {
  const OrderConfirmed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.services, icon: AppAssets.servicesIcon),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ConfirmationHeader(),
                  SizedBox(height: 12.h),
                  TimeLine(),
                  SizedBox(height: 16.h),
                  AppointmentTime(),
                  SizedBox(height: 16.h),
                  Guidance(),
                  SizedBox(height: 24.h),
                  PrimaryButton(
                    label: AppStrings.trackOrderStatus,
                    onPressed: () => context.push(AppRoutes.orderTracking),
                    icon: Icons.arrow_back,
                  ),
                  SizedBox(height: 10.h,),
                  PrimaryButton(
                    label: AppStrings.trackOrderStatus,
                    onPressed: () {},
                    icon: Icons.home_outlined,
                    color: AppColors.white,
                    borderColor: AppColors.primaryColor,
                    borderWidth: 2,
                    textColor: AppColors.primaryColor,
                    
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    SvgPicture.asset(AppAssets.callCenter, color: AppColors.white500,),
                    Text(AppStrings.needRescheduling, style: AppTextStyle.f12w500(context),),

                    Expanded(child: TextButton(
                    
                      onPressed: (){}, child: Text(AppStrings.contactNivoSupport, style: AppTextStyle.f12w500(context),)))
                  ],)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
