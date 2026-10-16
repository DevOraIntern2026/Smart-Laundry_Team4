import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/features/services/presentation/widgets/order_confirmed_widgets/confirmation_icon.dart';

class ConfirmationHeader extends StatelessWidget {
  const ConfirmationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ConfirmationIcon(),
        SizedBox(height: 10,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: AppColors.darkblue100,
            borderRadius: BorderRadius.circular(50.r)
          ),
          child: Text("نيفو. خدمة الغسيل الذكي", style: AppTextStyle.f12w500(context, color: AppColors.darkblue600),),
        ),
        SizedBox(height: 10,),
        Text("تم تأكيد طلبك بنجاح", style: AppTextStyle.heading(context),),

        SizedBox(height: 10,),
        Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("رقم الطلب الخاص بك هو"),
              SizedBox(width: 5.w,),
              Text("sl_123", style: AppTextStyle.f12w700(context, color: AppColors.darkblue600),),
            ],
          ),
          Text("لقد تم ارسال اشعار للمندوب")
        ],)
      ],
    );
  }
}