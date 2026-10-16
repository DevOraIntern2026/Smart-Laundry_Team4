import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/features/services/presentation/widgets/address_appointment_details.dart';

class AppointmentTime extends StatelessWidget {
  const AppointmentTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _iconBox(Icons.date_range_outlined),
                  SizedBox(width: 8.w),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "موعد الزيارة",
                        style: AppTextStyle.f12w500(
                          context,
                          color: AppColors.white500,
                        ),
                      ),
                      Text("السبت 24 اكتوبر", style: AppTextStyle.f12w500(context, color: AppColors.white800),),
                    ],
                  ),
                ],
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.darkblue50,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Text("10:00 ص : 01:00م", style: AppTextStyle.f12w700(context, color: AppColors.darkblue600),),
              )
            ],
          ),
          SizedBox(height: 12.h,),
          AddressAppointmentDetails(

          )
        ],
      ),
    );
  }

  Widget _iconBox(IconData icon) {
    return Container(
      padding: EdgeInsets.all(9.w),
      decoration: BoxDecoration(
        color: AppColors.darkblue100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(Icons.date_range, color: AppColors.darkblue600),
    );
  }
}
